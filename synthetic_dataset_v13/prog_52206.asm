; DESCRIPTION: Creates a white circular shape at (470, 232) with radius 20.
; PLAN: r0=470(x), r1=232(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 470
LDI r1, 232
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
