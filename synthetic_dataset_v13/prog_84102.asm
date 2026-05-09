; DESCRIPTION: Places a purple line segment connecting (231, 98) to (443, 123).
; PLAN: r0=231(x1), r1=98(y1), r2=443(x2), r3=123(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 98
LDI r2, 443
LDI r3, 123
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
