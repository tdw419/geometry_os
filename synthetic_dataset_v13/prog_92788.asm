; DESCRIPTION: Places a purple circle of radius 57 at center (334, 166).
; PLAN: r0=334(x), r1=166(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 166
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
