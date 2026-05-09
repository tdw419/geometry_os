; DESCRIPTION: Renders a red disk with center (452, 203) and radius 43.
; PLAN: r0=452(x), r1=203(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 452
LDI r1, 203
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
