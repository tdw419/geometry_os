; DESCRIPTION: Places a purple line segment connecting (4, 10) to (197, 85).
; PLAN: r0=4(x1), r1=10(y1), r2=197(x2), r3=85(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 10
LDI r2, 197
LDI r3, 85
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
