; DESCRIPTION: Places a blue line segment connecting (208, 51) to (428, 30).
; PLAN: r0=208(x1), r1=51(y1), r2=428(x2), r3=30(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 51
LDI r2, 428
LDI r3, 30
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
