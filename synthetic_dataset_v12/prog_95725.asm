; DESCRIPTION: Places a purple circle of radius 10 at center (132, 226).
; PLAN: r0=132(x), r1=226(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 226
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
