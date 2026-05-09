; DESCRIPTION: Renders a red disk with center (331, 80) and radius 43.
; PLAN: r0=331(x), r1=80(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 331
LDI r1, 80
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
