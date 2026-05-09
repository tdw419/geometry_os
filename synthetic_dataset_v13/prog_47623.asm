; DESCRIPTION: Places a blue circle of radius 75 at center (431, 152).
; PLAN: r0=431(x), r1=152(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 431
LDI r1, 152
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
