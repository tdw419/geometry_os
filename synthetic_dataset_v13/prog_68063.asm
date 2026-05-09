; DESCRIPTION: Places a purple circle of radius 62 at center (281, 159).
; PLAN: r0=281(x), r1=159(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 159
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
