; DESCRIPTION: Draws a purple circle centered at (374, 151) with radius 40.
; PLAN: r0=374(x), r1=151(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 151
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
