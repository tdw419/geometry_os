; DESCRIPTION: Renders a black disk with center (46, 45) and radius 43.
; PLAN: r0=46(x), r1=45(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 45
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
