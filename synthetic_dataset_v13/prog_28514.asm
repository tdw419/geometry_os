; DESCRIPTION: Renders a black disk with center (352, 71) and radius 36.
; PLAN: r0=352(x), r1=71(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 71
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
