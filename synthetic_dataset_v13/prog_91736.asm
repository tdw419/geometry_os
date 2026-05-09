; DESCRIPTION: Renders a red disk with center (191, 163) and radius 10.
; PLAN: r0=191(x), r1=163(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 163
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
