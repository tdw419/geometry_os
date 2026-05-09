; DESCRIPTION: Renders a magenta disk with center (183, 25) and radius 11.
; PLAN: r0=183(x), r1=25(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 25
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
