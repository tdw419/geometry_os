; DESCRIPTION: Draws a purple circle centered at (340, 162) with radius 51.
; PLAN: r0=340(x), r1=162(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 162
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
