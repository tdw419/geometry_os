; DESCRIPTION: Renders a magenta disk with center (52, 125) and radius 21.
; PLAN: r0=52(x), r1=125(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 52
LDI r1, 125
LDI r2, 21
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
