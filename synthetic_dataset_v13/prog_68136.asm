; DESCRIPTION: Renders a blue box of size 110x17 starting at (112, 101).
; PLAN: r0=112(x), r1=101(y), r2=110(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 101
LDI r2, 110
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
