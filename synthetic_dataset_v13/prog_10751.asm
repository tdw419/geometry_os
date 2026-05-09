; DESCRIPTION: Places a purple line segment connecting (301, 25) to (166, 26).
; PLAN: r0=301(x1), r1=25(y1), r2=166(x2), r3=26(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 25
LDI r2, 166
LDI r3, 26
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
