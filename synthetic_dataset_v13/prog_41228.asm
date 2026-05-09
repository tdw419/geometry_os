; DESCRIPTION: Places a blue line segment connecting (504, 111) to (438, 185).
; PLAN: r0=504(x1), r1=111(y1), r2=438(x2), r3=185(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 111
LDI r2, 438
LDI r3, 185
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
