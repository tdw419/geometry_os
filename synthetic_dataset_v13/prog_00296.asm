; DESCRIPTION: Renders a red disk with center (358, 165) and radius 23.
; PLAN: r0=358(x), r1=165(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 358
LDI r1, 165
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
