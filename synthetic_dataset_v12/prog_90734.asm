; DESCRIPTION: Renders a black disk with center (335, 146) and radius 74.
; PLAN: r0=335(x), r1=146(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 146
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
