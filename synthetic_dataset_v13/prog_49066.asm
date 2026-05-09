; DESCRIPTION: Renders a magenta disk with center (292, 66) and radius 65.
; PLAN: r0=292(x), r1=66(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 66
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
