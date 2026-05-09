; DESCRIPTION: Places a green line segment connecting (5, 169) to (301, 66).
; PLAN: r0=5(x1), r1=169(y1), r2=301(x2), r3=66(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 169
LDI r2, 301
LDI r3, 66
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
