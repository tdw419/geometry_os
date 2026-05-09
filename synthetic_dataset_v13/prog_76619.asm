; DESCRIPTION: Renders a red disk with center (131, 148) and radius 33.
; PLAN: r0=131(x), r1=148(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 148
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
