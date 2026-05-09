; DESCRIPTION: Renders a magenta disk with center (172, 125) and radius 76.
; PLAN: r0=172(x), r1=125(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 125
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
