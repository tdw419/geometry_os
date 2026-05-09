; DESCRIPTION: Places a purple line segment connecting (146, 142) to (229, 251).
; PLAN: r0=146(x1), r1=142(y1), r2=229(x2), r3=251(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 142
LDI r2, 229
LDI r3, 251
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
