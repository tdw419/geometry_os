; DESCRIPTION: Places a purple line segment connecting (154, 149) to (431, 141).
; PLAN: r0=154(x1), r1=149(y1), r2=431(x2), r3=141(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 149
LDI r2, 431
LDI r3, 141
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
