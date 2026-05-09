; DESCRIPTION: Renders a magenta disk with center (423, 151) and radius 78.
; PLAN: r0=423(x), r1=151(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 151
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
