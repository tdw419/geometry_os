; DESCRIPTION: Renders a black disk with center (319, 91) and radius 16.
; PLAN: r0=319(x), r1=91(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 319
LDI r1, 91
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
