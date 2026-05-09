; DESCRIPTION: Places a blue line segment connecting (270, 77) to (475, 39).
; PLAN: r0=270(x1), r1=77(y1), r2=475(x2), r3=39(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 77
LDI r2, 475
LDI r3, 39
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
