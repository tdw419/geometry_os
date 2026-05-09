; DESCRIPTION: Renders a magenta disk with center (364, 169) and radius 77.
; PLAN: r0=364(x), r1=169(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 169
LDI r2, 77
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
