; DESCRIPTION: Places a purple circle of radius 75 at center (113, 175).
; PLAN: r0=113(x), r1=175(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 175
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
