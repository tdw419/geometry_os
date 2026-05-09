; DESCRIPTION: Renders a yellow disk with center (171, 110) and radius 55.
; PLAN: r0=171(x), r1=110(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 110
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
