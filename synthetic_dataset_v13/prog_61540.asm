; DESCRIPTION: Places a white line segment connecting (431, 51) to (367, 222).
; PLAN: r0=431(x1), r1=51(y1), r2=367(x2), r3=222(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 51
LDI r2, 367
LDI r3, 222
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
