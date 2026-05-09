; DESCRIPTION: Renders a black disk with center (355, 207) and radius 46.
; PLAN: r0=355(x), r1=207(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 207
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
