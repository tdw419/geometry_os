; DESCRIPTION: Places a purple line segment connecting (102, 123) to (235, 190).
; PLAN: r0=102(x1), r1=123(y1), r2=235(x2), r3=190(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 123
LDI r2, 235
LDI r3, 190
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
