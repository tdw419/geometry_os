; DESCRIPTION: Renders a black disk with center (303, 178) and radius 55.
; PLAN: r0=303(x), r1=178(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 178
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
