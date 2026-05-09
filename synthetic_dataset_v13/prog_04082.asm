; DESCRIPTION: Renders a yellow disk with center (437, 153) and radius 70.
; PLAN: r0=437(x), r1=153(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 437
LDI r1, 153
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
