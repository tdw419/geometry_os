; DESCRIPTION: Renders a blue box of size 22x110 starting at (73, 136).
; PLAN: r0=73(x), r1=136(y), r2=22(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 136
LDI r2, 22
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
