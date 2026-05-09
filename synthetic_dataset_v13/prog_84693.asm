; DESCRIPTION: Creates a green circular shape at (71, 135) with radius 71.
; PLAN: r0=71(x), r1=135(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 135
LDI r2, 71
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
