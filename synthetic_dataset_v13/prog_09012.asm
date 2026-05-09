; DESCRIPTION: Draws a black circle centered at (103, 200) with radius 17.
; PLAN: r0=103(x), r1=200(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 200
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
