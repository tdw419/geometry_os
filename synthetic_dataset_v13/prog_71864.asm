; DESCRIPTION: Places a purple line segment connecting (396, 187) to (510, 50).
; PLAN: r0=396(x1), r1=187(y1), r2=510(x2), r3=50(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 187
LDI r2, 510
LDI r3, 50
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
