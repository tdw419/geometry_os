; DESCRIPTION: Renders a black disk with center (468, 222) and radius 21.
; PLAN: r0=468(x), r1=222(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 468
LDI r1, 222
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
