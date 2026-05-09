; DESCRIPTION: Places a purple circle of radius 34 at center (162, 135).
; PLAN: r0=162(x), r1=135(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 135
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
