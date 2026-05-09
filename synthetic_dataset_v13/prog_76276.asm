; DESCRIPTION: Renders a magenta disk with center (240, 106) and radius 51.
; PLAN: r0=240(x), r1=106(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 240
LDI r1, 106
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
