; DESCRIPTION: Renders a red disk with center (355, 162) and radius 76.
; PLAN: r0=355(x), r1=162(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 162
LDI r2, 76
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
