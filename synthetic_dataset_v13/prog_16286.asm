; DESCRIPTION: Creates a green circular shape at (336, 114) with radius 68.
; PLAN: r0=336(x), r1=114(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 336
LDI r1, 114
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
