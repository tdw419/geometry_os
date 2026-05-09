; DESCRIPTION: Renders a magenta disk with center (414, 151) and radius 51.
; PLAN: r0=414(x), r1=151(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 414
LDI r1, 151
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
