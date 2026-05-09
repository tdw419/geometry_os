; DESCRIPTION: Places a yellow circle of radius 36 at center (81, 203).
; PLAN: r0=81(x), r1=203(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 203
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
