; DESCRIPTION: Places a blue line segment connecting (511, 80) to (19, 150).
; PLAN: r0=511(x1), r1=80(y1), r2=19(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 80
LDI r2, 19
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
