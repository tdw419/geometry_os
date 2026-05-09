; DESCRIPTION: Creates a blue circular shape at (260, 139) with radius 26.
; PLAN: r0=260(x), r1=139(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 260
LDI r1, 139
LDI r2, 26
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
