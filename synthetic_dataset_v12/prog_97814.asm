; DESCRIPTION: Draws a black circle centered at (275, 191) with radius 40.
; PLAN: r0=275(x), r1=191(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 191
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
