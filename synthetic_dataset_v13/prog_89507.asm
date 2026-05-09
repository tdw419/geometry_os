; DESCRIPTION: Places a purple circle of radius 20 at center (418, 95).
; PLAN: r0=418(x), r1=95(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 95
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
