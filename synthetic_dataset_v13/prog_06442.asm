; DESCRIPTION: Renders a red disk with center (378, 91) and radius 33.
; PLAN: r0=378(x), r1=91(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 91
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
