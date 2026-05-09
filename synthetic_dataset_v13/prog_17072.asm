; DESCRIPTION: Draws a black circle centered at (373, 118) with radius 28.
; PLAN: r0=373(x), r1=118(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 118
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
