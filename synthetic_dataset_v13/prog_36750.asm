; DESCRIPTION: Places a blue line segment connecting (367, 38) to (428, 114).
; PLAN: r0=367(x1), r1=38(y1), r2=428(x2), r3=114(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 38
LDI r2, 428
LDI r3, 114
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
