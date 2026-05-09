; DESCRIPTION: Places a purple circle of radius 50 at center (382, 206).
; PLAN: r0=382(x), r1=206(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 206
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
