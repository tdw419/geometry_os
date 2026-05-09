; DESCRIPTION: Draws a black circle centered at (482, 218) with radius 19.
; PLAN: r0=482(x), r1=218(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 482
LDI r1, 218
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
