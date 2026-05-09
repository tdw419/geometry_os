; DESCRIPTION: Renders a red disk with center (355, 153) and radius 51.
; PLAN: r0=355(x), r1=153(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 153
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
