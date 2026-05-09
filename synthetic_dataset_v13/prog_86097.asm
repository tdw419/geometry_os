; DESCRIPTION: Places a purple circle of radius 16 at center (43, 179).
; PLAN: r0=43(x), r1=179(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 43
LDI r1, 179
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
