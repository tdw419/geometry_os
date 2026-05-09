; DESCRIPTION: Places a yellow line segment connecting (37, 158) to (99, 235).
; PLAN: r0=37(x1), r1=158(y1), r2=99(x2), r3=235(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 158
LDI r2, 99
LDI r3, 235
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
