; DESCRIPTION: Renders a magenta disk with center (361, 117) and radius 78.
; PLAN: r0=361(x), r1=117(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 117
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
