; DESCRIPTION: Draws a black circle centered at (321, 173) with radius 61.
; PLAN: r0=321(x), r1=173(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 321
LDI r1, 173
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
