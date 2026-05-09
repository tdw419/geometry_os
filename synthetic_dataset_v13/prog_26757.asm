; DESCRIPTION: Places a purple line segment connecting (77, 190) to (235, 32).
; PLAN: r0=77(x1), r1=190(y1), r2=235(x2), r3=32(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 190
LDI r2, 235
LDI r3, 32
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
