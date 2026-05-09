; DESCRIPTION: Creates a black circular shape at (174, 81) with radius 65.
; PLAN: r0=174(x), r1=81(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 81
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
