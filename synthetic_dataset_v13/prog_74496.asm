; DESCRIPTION: Renders a yellow disk with center (475, 38) and radius 19.
; PLAN: r0=475(x), r1=38(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 475
LDI r1, 38
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
