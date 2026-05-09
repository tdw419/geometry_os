; DESCRIPTION: Places a blue line segment connecting (372, 3) to (251, 241).
; PLAN: r0=372(x1), r1=3(y1), r2=251(x2), r3=241(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 3
LDI r2, 251
LDI r3, 241
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
