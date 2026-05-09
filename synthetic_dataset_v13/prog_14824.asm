; DESCRIPTION: Renders a magenta disk with center (286, 65) and radius 22.
; PLAN: r0=286(x), r1=65(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 65
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
