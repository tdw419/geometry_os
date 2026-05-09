; DESCRIPTION: Places a blue line segment connecting (495, 186) to (493, 39).
; PLAN: r0=495(x1), r1=186(y1), r2=493(x2), r3=39(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 186
LDI r2, 493
LDI r3, 39
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
