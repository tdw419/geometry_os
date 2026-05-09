; DESCRIPTION: Creates a white circular shape at (235, 137) with radius 11.
; PLAN: r0=235(x), r1=137(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 235
LDI r1, 137
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
