; DESCRIPTION: Renders a black disk with center (340, 91) and radius 66.
; PLAN: r0=340(x), r1=91(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 91
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
