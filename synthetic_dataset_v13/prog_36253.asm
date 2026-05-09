; DESCRIPTION: Places a blue line segment connecting (18, 177) to (468, 75).
; PLAN: r0=18(x1), r1=177(y1), r2=468(x2), r3=75(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 177
LDI r2, 468
LDI r3, 75
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
