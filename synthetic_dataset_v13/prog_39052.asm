; DESCRIPTION: Places a purple line segment connecting (180, 97) to (161, 37).
; PLAN: r0=180(x1), r1=97(y1), r2=161(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 97
LDI r2, 161
LDI r3, 37
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
