; DESCRIPTION: Places a purple line segment connecting (393, 151) to (124, 108).
; PLAN: r0=393(x1), r1=151(y1), r2=124(x2), r3=108(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 151
LDI r2, 124
LDI r3, 108
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
