; DESCRIPTION: Places a purple line segment connecting (29, 8) to (328, 46).
; PLAN: r0=29(x1), r1=8(y1), r2=328(x2), r3=46(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 8
LDI r2, 328
LDI r3, 46
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
