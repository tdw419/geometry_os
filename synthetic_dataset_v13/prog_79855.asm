; DESCRIPTION: Renders a magenta disk with center (321, 102) and radius 66.
; PLAN: r0=321(x), r1=102(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 321
LDI r1, 102
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
