; DESCRIPTION: Renders a red disk with center (81, 115) and radius 19.
; PLAN: r0=81(x), r1=115(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 115
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
