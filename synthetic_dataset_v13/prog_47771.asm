; DESCRIPTION: Creates a black circular shape at (254, 141) with radius 58.
; PLAN: r0=254(x), r1=141(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 141
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
