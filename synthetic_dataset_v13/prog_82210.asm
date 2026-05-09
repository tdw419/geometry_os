; DESCRIPTION: Draws a black circle centered at (249, 162) with radius 21.
; PLAN: r0=249(x), r1=162(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 162
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
