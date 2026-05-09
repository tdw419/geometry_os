; DESCRIPTION: Places a purple circle of radius 13 at center (352, 90).
; PLAN: r0=352(x), r1=90(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 90
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
