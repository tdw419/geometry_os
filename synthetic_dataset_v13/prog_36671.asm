; DESCRIPTION: Places a blue line segment connecting (110, 22) to (203, 195).
; PLAN: r0=110(x1), r1=22(y1), r2=203(x2), r3=195(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 22
LDI r2, 203
LDI r3, 195
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
