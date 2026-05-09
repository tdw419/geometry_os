; DESCRIPTION: Renders a yellow disk with center (286, 71) and radius 16.
; PLAN: r0=286(x), r1=71(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 71
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
