; DESCRIPTION: Renders a black disk with center (120, 146) and radius 19.
; PLAN: r0=120(x), r1=146(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 146
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
