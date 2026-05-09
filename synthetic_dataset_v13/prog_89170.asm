; DESCRIPTION: Draws a purple circle centered at (374, 166) with radius 66.
; PLAN: r0=374(x), r1=166(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 166
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
