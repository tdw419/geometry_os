; DESCRIPTION: Places a purple circle of radius 70 at center (140, 166).
; PLAN: r0=140(x), r1=166(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 166
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
