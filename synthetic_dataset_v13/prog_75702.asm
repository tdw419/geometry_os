; DESCRIPTION: Creates a black circular shape at (273, 79) with radius 10.
; PLAN: r0=273(x), r1=79(y), r2=10(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 79
LDI r2, 10
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
