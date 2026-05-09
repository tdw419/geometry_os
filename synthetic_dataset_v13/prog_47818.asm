; DESCRIPTION: Renders a magenta disk with center (217, 91) and radius 37.
; PLAN: r0=217(x), r1=91(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 91
LDI r2, 37
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
