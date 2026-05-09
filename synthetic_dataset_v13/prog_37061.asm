; DESCRIPTION: Places a black circle of radius 73 at center (132, 84).
; PLAN: r0=132(x), r1=84(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 84
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
