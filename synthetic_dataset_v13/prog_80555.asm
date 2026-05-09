; DESCRIPTION: Places a purple circle of radius 19 at center (85, 166).
; PLAN: r0=85(x), r1=166(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 166
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
