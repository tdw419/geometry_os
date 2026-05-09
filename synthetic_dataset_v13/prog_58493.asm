; DESCRIPTION: Draws a black circle centered at (181, 129) with radius 69.
; PLAN: r0=181(x), r1=129(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 129
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
