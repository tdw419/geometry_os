; DESCRIPTION: Renders a magenta disk with center (144, 134) and radius 52.
; PLAN: r0=144(x), r1=134(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 134
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
