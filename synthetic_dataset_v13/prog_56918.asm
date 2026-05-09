; DESCRIPTION: Renders a yellow disk with center (438, 110) and radius 63.
; PLAN: r0=438(x), r1=110(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 438
LDI r1, 110
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
