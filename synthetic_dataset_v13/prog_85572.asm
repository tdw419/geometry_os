; DESCRIPTION: Renders a black disk with center (241, 205) and radius 15.
; PLAN: r0=241(x), r1=205(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 205
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
