; DESCRIPTION: Places a purple line segment connecting (146, 149) to (18, 110).
; PLAN: r0=146(x1), r1=149(y1), r2=18(x2), r3=110(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 149
LDI r2, 18
LDI r3, 110
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
