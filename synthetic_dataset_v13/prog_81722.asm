; DESCRIPTION: Renders a magenta disk with center (248, 116) and radius 78.
; PLAN: r0=248(x), r1=116(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 248
LDI r1, 116
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
