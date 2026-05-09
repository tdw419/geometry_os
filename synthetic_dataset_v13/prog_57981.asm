; DESCRIPTION: Draws a black circle centered at (165, 109) with radius 80.
; PLAN: r0=165(x), r1=109(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 109
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
