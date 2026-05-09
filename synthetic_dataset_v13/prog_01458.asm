; DESCRIPTION: Renders a magenta disk with center (332, 163) and radius 37.
; PLAN: r0=332(x), r1=163(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 163
LDI r2, 37
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
