; DESCRIPTION: Renders a magenta disk with center (40, 194) and radius 10.
; PLAN: r0=40(x), r1=194(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 40
LDI r1, 194
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
