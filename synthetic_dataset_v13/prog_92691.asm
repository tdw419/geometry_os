; DESCRIPTION: Renders a black disk with center (275, 208) and radius 38.
; PLAN: r0=275(x), r1=208(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 208
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
