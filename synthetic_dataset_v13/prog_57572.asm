; DESCRIPTION: Renders a magenta disk with center (318, 147) and radius 31.
; PLAN: r0=318(x), r1=147(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 318
LDI r1, 147
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
