; DESCRIPTION: Creates a white circular shape at (369, 52) with radius 34.
; PLAN: r0=369(x), r1=52(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 369
LDI r1, 52
LDI r2, 34
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
