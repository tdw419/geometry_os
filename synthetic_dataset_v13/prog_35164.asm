; DESCRIPTION: Renders a magenta disk with center (457, 48) and radius 33.
; PLAN: r0=457(x), r1=48(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 457
LDI r1, 48
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
