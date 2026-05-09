; DESCRIPTION: Places a purple line segment connecting (90, 27) to (98, 147).
; PLAN: r0=90(x1), r1=27(y1), r2=98(x2), r3=147(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 27
LDI r2, 98
LDI r3, 147
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
