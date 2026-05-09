; DESCRIPTION: Places a yellow line segment connecting (438, 30) to (177, 216).
; PLAN: r0=438(x1), r1=30(y1), r2=177(x2), r3=216(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 30
LDI r2, 177
LDI r3, 216
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
