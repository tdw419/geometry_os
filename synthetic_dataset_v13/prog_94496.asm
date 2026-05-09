; DESCRIPTION: Creates a black circular shape at (234, 209) with radius 15.
; PLAN: r0=234(x), r1=209(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 209
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
