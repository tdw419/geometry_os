; DESCRIPTION: Places a purple circle of radius 39 at center (231, 179).
; PLAN: r0=231(x), r1=179(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 179
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
