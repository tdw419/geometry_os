; DESCRIPTION: Creates a black circular shape at (407, 152) with radius 70.
; PLAN: r0=407(x), r1=152(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 152
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
