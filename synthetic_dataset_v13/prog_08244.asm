; DESCRIPTION: Places a purple line segment connecting (443, 252) to (121, 97).
; PLAN: r0=443(x1), r1=252(y1), r2=121(x2), r3=97(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 252
LDI r2, 121
LDI r3, 97
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
