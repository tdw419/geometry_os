; DESCRIPTION: Draws a blue circle centered at (112, 226) with radius 17.
; PLAN: r0=112(x), r1=226(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 226
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
