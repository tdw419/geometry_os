; DESCRIPTION: Places a orange 60x58 rectangle at position (324, 1).
; PLAN: r0=324(x), r1=1(y), r2=60(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 1
LDI r2, 60
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
