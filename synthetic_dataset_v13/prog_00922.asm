; DESCRIPTION: Renders a magenta disk with center (165, 127) and radius 51.
; PLAN: r0=165(x), r1=127(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 127
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
