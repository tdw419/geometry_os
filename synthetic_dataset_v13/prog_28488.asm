; DESCRIPTION: Places a blue line segment connecting (441, 38) to (140, 9).
; PLAN: r0=441(x1), r1=38(y1), r2=140(x2), r3=9(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 38
LDI r2, 140
LDI r3, 9
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
