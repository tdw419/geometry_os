; DESCRIPTION: Places a purple line segment connecting (198, 90) to (300, 129).
; PLAN: r0=198(x1), r1=90(y1), r2=300(x2), r3=129(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 90
LDI r2, 300
LDI r3, 129
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
