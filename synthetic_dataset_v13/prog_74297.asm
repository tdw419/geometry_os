; DESCRIPTION: Places a black circle of radius 79 at center (80, 153).
; PLAN: r0=80(x), r1=153(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 153
LDI r2, 79
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
