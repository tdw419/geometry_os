; DESCRIPTION: Renders a magenta disk with center (51, 141) and radius 27.
; PLAN: r0=51(x), r1=141(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 141
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
