; DESCRIPTION: Draws a black circle centered at (403, 107) with radius 19.
; PLAN: r0=403(x), r1=107(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 107
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
