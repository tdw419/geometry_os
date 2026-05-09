; DESCRIPTION: Renders a red disk with center (232, 95) and radius 43.
; PLAN: r0=232(x), r1=95(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 232
LDI r1, 95
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
