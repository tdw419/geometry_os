; DESCRIPTION: Places a purple line segment connecting (132, 254) to (116, 46).
; PLAN: r0=132(x1), r1=254(y1), r2=116(x2), r3=46(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 254
LDI r2, 116
LDI r3, 46
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
