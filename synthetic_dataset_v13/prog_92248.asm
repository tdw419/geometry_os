; DESCRIPTION: Creates a blue circular shape at (73, 147) with radius 47.
; PLAN: r0=73(x), r1=147(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 147
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
