; DESCRIPTION: Renders a red disk with center (167, 115) and radius 37.
; PLAN: r0=167(x), r1=115(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 115
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
