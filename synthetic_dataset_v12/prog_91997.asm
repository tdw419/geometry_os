; DESCRIPTION: Places a purple line segment connecting (46, 230) to (87, 66).
; PLAN: r0=46(x1), r1=230(y1), r2=87(x2), r3=66(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 230
LDI r2, 87
LDI r3, 66
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
