; DESCRIPTION: Places a purple line segment connecting (439, 37) to (389, 154).
; PLAN: r0=439(x1), r1=37(y1), r2=389(x2), r3=154(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 37
LDI r2, 389
LDI r3, 154
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
