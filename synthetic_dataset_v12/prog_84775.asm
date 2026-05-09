; DESCRIPTION: Renders a black disk with center (148, 187) and radius 38.
; PLAN: r0=148(x), r1=187(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 187
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
