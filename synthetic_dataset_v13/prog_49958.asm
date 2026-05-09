; DESCRIPTION: Places a purple line segment connecting (197, 219) to (465, 105).
; PLAN: r0=197(x1), r1=219(y1), r2=465(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 219
LDI r2, 465
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
