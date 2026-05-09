; DESCRIPTION: Renders a magenta disk with center (93, 162) and radius 65.
; PLAN: r0=93(x), r1=162(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 162
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
