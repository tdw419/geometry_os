; DESCRIPTION: Renders a magenta disk with center (382, 78) and radius 27.
; PLAN: r0=382(x), r1=78(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 78
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
