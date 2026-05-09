; DESCRIPTION: Places a purple line segment connecting (411, 186) to (31, 231).
; PLAN: r0=411(x1), r1=186(y1), r2=31(x2), r3=231(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 186
LDI r2, 31
LDI r3, 231
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
