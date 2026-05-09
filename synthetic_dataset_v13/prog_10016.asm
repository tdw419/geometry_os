; DESCRIPTION: Places a purple line segment connecting (344, 89) to (342, 235).
; PLAN: r0=344(x1), r1=89(y1), r2=342(x2), r3=235(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 89
LDI r2, 342
LDI r3, 235
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
