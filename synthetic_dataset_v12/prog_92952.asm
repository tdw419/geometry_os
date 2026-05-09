; DESCRIPTION: Creates a yellow circular shape at (260, 139) with radius 36.
; PLAN: r0=260(x), r1=139(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 260
LDI r1, 139
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
