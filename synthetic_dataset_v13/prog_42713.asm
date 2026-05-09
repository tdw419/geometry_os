; DESCRIPTION: Renders a magenta disk with center (153, 134) and radius 57.
; PLAN: r0=153(x), r1=134(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 134
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
