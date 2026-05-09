; DESCRIPTION: Renders a yellow disk with center (302, 182) and radius 66.
; PLAN: r0=302(x), r1=182(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 182
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
