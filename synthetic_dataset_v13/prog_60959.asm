; DESCRIPTION: Places a blue circle of radius 35 at center (424, 132).
; PLAN: r0=424(x), r1=132(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 132
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
