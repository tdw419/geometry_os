; DESCRIPTION: Draws a blue circle centered at (216, 154) with radius 17.
; PLAN: r0=216(x), r1=154(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 154
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
