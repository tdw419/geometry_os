; DESCRIPTION: Draws a purple circle centered at (17, 107) with radius 13.
; PLAN: r0=17(x), r1=107(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 17
LDI r1, 107
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
