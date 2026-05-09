; DESCRIPTION: Creates a magenta circular shape at (361, 147) with radius 22.
; PLAN: r0=361(x), r1=147(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 147
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
