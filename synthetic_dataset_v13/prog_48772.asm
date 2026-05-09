; DESCRIPTION: Renders a red disk with center (355, 165) and radius 79.
; PLAN: r0=355(x), r1=165(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 165
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
