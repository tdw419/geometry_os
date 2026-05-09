; DESCRIPTION: Creates a blue circular shape at (414, 174) with radius 22.
; PLAN: r0=414(x), r1=174(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 414
LDI r1, 174
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
