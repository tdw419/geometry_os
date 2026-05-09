; DESCRIPTION: Places a purple line segment connecting (437, 152) to (385, 20).
; PLAN: r0=437(x1), r1=152(y1), r2=385(x2), r3=20(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 152
LDI r2, 385
LDI r3, 20
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
