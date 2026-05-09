; DESCRIPTION: Creates a green circular shape at (71, 207) with radius 47.
; PLAN: r0=71(x), r1=207(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 207
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
