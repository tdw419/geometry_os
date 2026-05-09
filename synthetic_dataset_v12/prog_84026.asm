; DESCRIPTION: Places a purple circle of radius 30 at center (303, 219).
; PLAN: r0=303(x), r1=219(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 219
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
