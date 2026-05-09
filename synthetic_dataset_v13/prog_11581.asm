; DESCRIPTION: Places a purple circle of radius 44 at center (182, 195).
; PLAN: r0=182(x), r1=195(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 195
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
