; DESCRIPTION: Renders a magenta disk with center (361, 105) and radius 13.
; PLAN: r0=361(x), r1=105(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 105
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
