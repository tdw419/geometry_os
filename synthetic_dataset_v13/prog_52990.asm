; DESCRIPTION: Draws a black circle centered at (78, 211) with radius 27.
; PLAN: r0=78(x), r1=211(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 211
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
