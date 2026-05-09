; DESCRIPTION: Renders a red disk with center (101, 204) and radius 48.
; PLAN: r0=101(x), r1=204(y), r2=48(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 204
LDI r2, 48
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
