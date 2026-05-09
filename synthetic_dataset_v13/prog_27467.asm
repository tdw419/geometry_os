; DESCRIPTION: Creates a orange circular shape at (71, 124) with radius 52.
; PLAN: r0=71(x), r1=124(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 124
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
