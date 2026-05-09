; DESCRIPTION: Places a purple line segment connecting (133, 154) to (191, 45).
; PLAN: r0=133(x1), r1=154(y1), r2=191(x2), r3=45(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 154
LDI r2, 191
LDI r3, 45
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
