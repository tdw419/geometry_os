; DESCRIPTION: Renders a red disk with center (40, 203) and radius 25.
; PLAN: r0=40(x), r1=203(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 40
LDI r1, 203
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
