; DESCRIPTION: Places a purple line segment connecting (180, 182) to (366, 152).
; PLAN: r0=180(x1), r1=182(y1), r2=366(x2), r3=152(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 182
LDI r2, 366
LDI r3, 152
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
