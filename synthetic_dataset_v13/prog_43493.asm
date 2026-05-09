; DESCRIPTION: Draws a black circle centered at (470, 141) with radius 22.
; PLAN: r0=470(x), r1=141(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 470
LDI r1, 141
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
