; DESCRIPTION: Renders a yellow disk with center (355, 221) and radius 11.
; PLAN: r0=355(x), r1=221(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 221
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
