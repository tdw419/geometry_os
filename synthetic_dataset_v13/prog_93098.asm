; DESCRIPTION: Creates a magenta circular shape at (437, 147) with radius 74.
; PLAN: r0=437(x), r1=147(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 437
LDI r1, 147
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
