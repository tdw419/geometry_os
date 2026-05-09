; DESCRIPTION: Places a green line segment connecting (339, 101) to (315, 235).
; PLAN: r0=339(x1), r1=101(y1), r2=315(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 101
LDI r2, 315
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
