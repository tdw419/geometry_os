; DESCRIPTION: Creates a white circular shape at (264, 137) with radius 68.
; PLAN: r0=264(x), r1=137(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 137
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
