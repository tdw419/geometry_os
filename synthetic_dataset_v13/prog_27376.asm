; DESCRIPTION: Places a purple line segment connecting (186, 20) to (335, 142).
; PLAN: r0=186(x1), r1=20(y1), r2=335(x2), r3=142(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 20
LDI r2, 335
LDI r3, 142
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
