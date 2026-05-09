; DESCRIPTION: Places a purple circle of radius 36 at center (214, 203).
; PLAN: r0=214(x), r1=203(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 203
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
