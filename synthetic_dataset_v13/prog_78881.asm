; DESCRIPTION: Draws a black circle centered at (420, 107) with radius 39.
; PLAN: r0=420(x), r1=107(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 107
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
