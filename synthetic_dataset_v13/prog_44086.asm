; DESCRIPTION: Renders a blue box of size 23x106 starting at (256, 145).
; PLAN: r0=256(x), r1=145(y), r2=23(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 145
LDI r2, 23
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
