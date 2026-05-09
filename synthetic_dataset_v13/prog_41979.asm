; DESCRIPTION: Creates a black circular shape at (275, 174) with radius 46.
; PLAN: r0=275(x), r1=174(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 174
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
