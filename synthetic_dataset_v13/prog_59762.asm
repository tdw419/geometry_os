; DESCRIPTION: Creates a green circular shape at (355, 44) with radius 15.
; PLAN: r0=355(x), r1=44(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 44
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
