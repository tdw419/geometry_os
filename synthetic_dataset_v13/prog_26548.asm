; DESCRIPTION: Draws a black circle centered at (411, 185) with radius 22.
; PLAN: r0=411(x), r1=185(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 185
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
