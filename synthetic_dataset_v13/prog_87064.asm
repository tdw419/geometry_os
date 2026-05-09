; DESCRIPTION: Places a purple circle of radius 29 at center (352, 134).
; PLAN: r0=352(x), r1=134(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 134
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
