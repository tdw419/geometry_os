; DESCRIPTION: Places a orange 39x60 rectangle at position (448, 45).
; PLAN: r0=448(x), r1=45(y), r2=39(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 45
LDI r2, 39
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
