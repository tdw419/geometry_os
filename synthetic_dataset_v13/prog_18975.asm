; DESCRIPTION: Renders a yellow disk with center (260, 138) and radius 49.
; PLAN: r0=260(x), r1=138(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 260
LDI r1, 138
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
