; DESCRIPTION: Creates a green circular shape at (186, 91) with radius 78.
; PLAN: r0=186(x), r1=91(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 91
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
