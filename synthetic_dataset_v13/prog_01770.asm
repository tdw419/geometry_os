; DESCRIPTION: Places a purple circle of radius 43 at center (329, 195).
; PLAN: r0=329(x), r1=195(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 195
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
