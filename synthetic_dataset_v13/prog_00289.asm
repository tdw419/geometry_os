; DESCRIPTION: Places a black circle of radius 79 at center (420, 145).
; PLAN: r0=420(x), r1=145(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 145
LDI r2, 79
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
