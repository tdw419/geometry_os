; DESCRIPTION: Places a blue line segment connecting (199, 20) to (468, 132).
; PLAN: r0=199(x1), r1=20(y1), r2=468(x2), r3=132(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 20
LDI r2, 468
LDI r3, 132
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
