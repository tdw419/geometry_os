; DESCRIPTION: Renders a red disk with center (265, 115) and radius 39.
; PLAN: r0=265(x), r1=115(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 265
LDI r1, 115
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
