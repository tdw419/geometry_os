; DESCRIPTION: Places a black circle of radius 79 at center (96, 102).
; PLAN: r0=96(x), r1=102(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 102
LDI r2, 79
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
