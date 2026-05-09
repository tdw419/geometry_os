; DESCRIPTION: Draws a black circle centered at (464, 38) with radius 22.
; PLAN: r0=464(x), r1=38(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 464
LDI r1, 38
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
