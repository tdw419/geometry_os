; DESCRIPTION: Renders a yellow disk with center (139, 92) and radius 65.
; PLAN: r0=139(x), r1=92(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 92
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
