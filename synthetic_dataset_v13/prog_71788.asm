; DESCRIPTION: Renders a magenta disk with center (409, 172) and radius 55.
; PLAN: r0=409(x), r1=172(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 172
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
