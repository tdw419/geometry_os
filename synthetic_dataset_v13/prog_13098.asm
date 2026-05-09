; DESCRIPTION: Renders a magenta disk with center (332, 163) and radius 66.
; PLAN: r0=332(x), r1=163(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 163
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
