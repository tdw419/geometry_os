; DESCRIPTION: Places a purple line segment connecting (280, 189) to (389, 192).
; PLAN: r0=280(x1), r1=189(y1), r2=389(x2), r3=192(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 189
LDI r2, 389
LDI r3, 192
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
