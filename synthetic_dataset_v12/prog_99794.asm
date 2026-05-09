; DESCRIPTION: Places a yellow circle of radius 43 at center (331, 152).
; PLAN: r0=331(x), r1=152(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 331
LDI r1, 152
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
