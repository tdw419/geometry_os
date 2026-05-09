; DESCRIPTION: Renders a magenta disk with center (109, 91) and radius 78.
; PLAN: r0=109(x), r1=91(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 91
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
