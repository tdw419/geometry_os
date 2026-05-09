; DESCRIPTION: Creates a white circular shape at (253, 186) with radius 17.
; PLAN: r0=253(x), r1=186(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 186
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
