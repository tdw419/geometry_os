; DESCRIPTION: Places a blue line segment connecting (177, 160) to (10, 212).
; PLAN: r0=177(x1), r1=160(y1), r2=10(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 160
LDI r2, 10
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
