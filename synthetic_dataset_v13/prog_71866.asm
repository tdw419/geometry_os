; DESCRIPTION: Places a purple circle of radius 15 at center (303, 222).
; PLAN: r0=303(x), r1=222(y), r2=15(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 222
LDI r2, 15
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
