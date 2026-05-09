; DESCRIPTION: Renders a magenta disk with center (317, 140) and radius 60.
; PLAN: r0=317(x), r1=140(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 140
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
