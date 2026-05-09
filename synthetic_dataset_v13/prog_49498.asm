; DESCRIPTION: Renders a magenta disk with center (362, 118) and radius 80.
; PLAN: r0=362(x), r1=118(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 118
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
