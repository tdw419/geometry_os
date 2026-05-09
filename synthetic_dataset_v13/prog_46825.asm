; DESCRIPTION: Creates a blue circular shape at (345, 192) with radius 58.
; PLAN: r0=345(x), r1=192(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 345
LDI r1, 192
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
