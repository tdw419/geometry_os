; DESCRIPTION: Places a orange 60x45 rectangle at position (1, 129).
; PLAN: r0=1(x), r1=129(y), r2=60(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 129
LDI r2, 60
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
