; DESCRIPTION: Places a purple circle of radius 53 at center (260, 94).
; PLAN: r0=260(x), r1=94(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 260
LDI r1, 94
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
