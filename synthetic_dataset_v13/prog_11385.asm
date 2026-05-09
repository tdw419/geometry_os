; DESCRIPTION: Renders a magenta disk with center (423, 172) and radius 14.
; PLAN: r0=423(x), r1=172(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 172
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
