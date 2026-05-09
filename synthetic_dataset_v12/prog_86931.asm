; DESCRIPTION: Places a black circle of radius 57 at center (453, 162).
; PLAN: r0=453(x), r1=162(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 453
LDI r1, 162
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
