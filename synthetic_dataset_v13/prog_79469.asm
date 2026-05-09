; DESCRIPTION: Renders a black disk with center (275, 161) and radius 22.
; PLAN: r0=275(x), r1=161(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 161
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
