; DESCRIPTION: Renders a black disk with center (146, 106) and radius 35.
; PLAN: r0=146(x), r1=106(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 106
LDI r2, 35
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
