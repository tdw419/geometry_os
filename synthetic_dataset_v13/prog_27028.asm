; DESCRIPTION: Places a yellow 85x49 rectangle at position (375, 145).
; PLAN: r0=375(x), r1=145(y), r2=85(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 145
LDI r2, 85
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
