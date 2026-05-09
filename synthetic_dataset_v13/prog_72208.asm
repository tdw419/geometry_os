; DESCRIPTION: Creates a green circular shape at (253, 202) with radius 43.
; PLAN: r0=253(x), r1=202(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 202
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
