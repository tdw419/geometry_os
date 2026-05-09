; DESCRIPTION: Places a purple line segment connecting (136, 150) to (321, 37).
; PLAN: r0=136(x1), r1=150(y1), r2=321(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 150
LDI r2, 321
LDI r3, 37
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
