; DESCRIPTION: Creates a black circular shape at (368, 175) with radius 29.
; PLAN: r0=368(x), r1=175(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 175
LDI r2, 29
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
