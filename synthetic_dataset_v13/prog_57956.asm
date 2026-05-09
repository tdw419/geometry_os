; DESCRIPTION: Places a purple line segment connecting (21, 200) to (207, 142).
; PLAN: r0=21(x1), r1=200(y1), r2=207(x2), r3=142(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 200
LDI r2, 207
LDI r3, 142
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
