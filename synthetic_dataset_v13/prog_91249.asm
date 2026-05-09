; DESCRIPTION: Places a blue line segment connecting (365, 90) to (220, 147).
; PLAN: r0=365(x1), r1=90(y1), r2=220(x2), r3=147(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 90
LDI r2, 220
LDI r3, 147
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
