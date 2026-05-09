; DESCRIPTION: Places a black line segment connecting (409, 183) to (48, 250).
; PLAN: r0=409(x1), r1=183(y1), r2=48(x2), r3=250(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 183
LDI r2, 48
LDI r3, 250
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
