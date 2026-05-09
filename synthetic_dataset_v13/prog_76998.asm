; DESCRIPTION: Creates a black circular shape at (394, 234) with radius 21.
; PLAN: r0=394(x), r1=234(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 234
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
