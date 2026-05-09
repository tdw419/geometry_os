; DESCRIPTION: Places a purple line segment connecting (87, 230) to (161, 5).
; PLAN: r0=87(x1), r1=230(y1), r2=161(x2), r3=5(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 230
LDI r2, 161
LDI r3, 5
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
