; DESCRIPTION: Places a yellow circle of radius 30 at center (381, 220).
; PLAN: r0=381(x), r1=220(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 220
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
