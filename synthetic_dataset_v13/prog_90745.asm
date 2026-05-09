; DESCRIPTION: Creates a magenta circular shape at (147, 74) with radius 61.
; PLAN: r0=147(x), r1=74(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 74
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
