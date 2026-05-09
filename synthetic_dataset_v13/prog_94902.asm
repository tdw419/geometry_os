; DESCRIPTION: Renders a magenta disk with center (208, 218) and radius 13.
; PLAN: r0=208(x), r1=218(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 218
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
