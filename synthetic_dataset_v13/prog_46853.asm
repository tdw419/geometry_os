; DESCRIPTION: Places a blue line segment connecting (504, 199) to (90, 160).
; PLAN: r0=504(x1), r1=199(y1), r2=90(x2), r3=160(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 199
LDI r2, 90
LDI r3, 160
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
