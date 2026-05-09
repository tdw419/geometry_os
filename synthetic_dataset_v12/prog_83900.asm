; DESCRIPTION: Places a purple line segment connecting (186, 179) to (467, 20).
; PLAN: r0=186(x1), r1=179(y1), r2=467(x2), r3=20(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 179
LDI r2, 467
LDI r3, 20
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
