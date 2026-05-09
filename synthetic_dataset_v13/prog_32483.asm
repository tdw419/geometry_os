; DESCRIPTION: Draws a black circle centered at (206, 106) with radius 58.
; PLAN: r0=206(x), r1=106(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 106
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
