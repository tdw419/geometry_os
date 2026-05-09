; DESCRIPTION: Places a purple circle of radius 18 at center (193, 167).
; PLAN: r0=193(x), r1=167(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 167
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
