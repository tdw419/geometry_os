; DESCRIPTION: Places a yellow circle of radius 68 at center (203, 132).
; PLAN: r0=203(x), r1=132(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 132
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
