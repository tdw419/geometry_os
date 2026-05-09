; DESCRIPTION: Renders a red disk with center (235, 203) and radius 44.
; PLAN: r0=235(x), r1=203(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 235
LDI r1, 203
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
