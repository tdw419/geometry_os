; DESCRIPTION: Renders a red disk with center (267, 85) and radius 62.
; PLAN: r0=267(x), r1=85(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 267
LDI r1, 85
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
