; DESCRIPTION: Creates a green circular shape at (369, 149) with radius 77.
; PLAN: r0=369(x), r1=149(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 369
LDI r1, 149
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
