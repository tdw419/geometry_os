; DESCRIPTION: Renders a blue disk with center (302, 182) and radius 72.
; PLAN: r0=302(x), r1=182(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 182
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
