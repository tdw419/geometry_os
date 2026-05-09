; DESCRIPTION: Draws a black circle centered at (435, 214) with radius 40.
; PLAN: r0=435(x), r1=214(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 435
LDI r1, 214
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
