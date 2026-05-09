; DESCRIPTION: Creates a green circular shape at (71, 60) with radius 56.
; PLAN: r0=71(x), r1=60(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 60
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
