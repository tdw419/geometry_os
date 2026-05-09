; DESCRIPTION: Draws a black circle centered at (197, 208) with radius 33.
; PLAN: r0=197(x), r1=208(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 208
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
