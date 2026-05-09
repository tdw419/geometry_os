; DESCRIPTION: Renders a red disk with center (324, 121) and radius 66.
; PLAN: r0=324(x), r1=121(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 121
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
