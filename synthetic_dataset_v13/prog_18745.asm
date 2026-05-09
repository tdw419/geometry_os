; DESCRIPTION: Renders a magenta disk with center (349, 188) and radius 51.
; PLAN: r0=349(x), r1=188(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 188
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
