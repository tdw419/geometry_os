; DESCRIPTION: Renders a yellow disk with center (223, 102) and radius 31.
; PLAN: r0=223(x), r1=102(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 102
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
