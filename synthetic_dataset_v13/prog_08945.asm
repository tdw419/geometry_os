; DESCRIPTION: Places a red circle of radius 80 at center (203, 114).
; PLAN: r0=203(x), r1=114(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 114
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
