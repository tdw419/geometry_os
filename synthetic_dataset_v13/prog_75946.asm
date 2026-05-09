; DESCRIPTION: Places a purple line segment connecting (287, 229) to (309, 52).
; PLAN: r0=287(x1), r1=229(y1), r2=309(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 229
LDI r2, 309
LDI r3, 52
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
