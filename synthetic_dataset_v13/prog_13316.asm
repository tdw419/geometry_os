; DESCRIPTION: Renders a red disk with center (382, 60) and radius 17.
; PLAN: r0=382(x), r1=60(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 60
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
