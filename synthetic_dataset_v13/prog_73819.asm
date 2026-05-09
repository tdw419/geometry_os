; DESCRIPTION: Renders a magenta disk with center (290, 100) and radius 37.
; PLAN: r0=290(x), r1=100(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 100
LDI r2, 37
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
