; DESCRIPTION: Renders a yellow disk with center (438, 92) and radius 26.
; PLAN: r0=438(x), r1=92(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 438
LDI r1, 92
LDI r2, 26
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
