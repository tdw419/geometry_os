; DESCRIPTION: Renders a black disk with center (216, 146) and radius 75.
; PLAN: r0=216(x), r1=146(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 146
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
