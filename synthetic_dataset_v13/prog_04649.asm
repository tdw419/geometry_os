; DESCRIPTION: Renders a black disk with center (468, 202) and radius 13.
; PLAN: r0=468(x), r1=202(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 468
LDI r1, 202
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
