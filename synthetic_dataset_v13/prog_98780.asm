; DESCRIPTION: Renders a magenta disk with center (292, 98) and radius 80.
; PLAN: r0=292(x), r1=98(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 98
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
