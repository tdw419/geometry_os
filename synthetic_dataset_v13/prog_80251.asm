; DESCRIPTION: Renders a yellow disk with center (437, 225) and radius 29.
; PLAN: r0=437(x), r1=225(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 437
LDI r1, 225
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
