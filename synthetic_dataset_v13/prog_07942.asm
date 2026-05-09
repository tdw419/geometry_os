; DESCRIPTION: Places a purple line segment connecting (448, 173) to (218, 69).
; PLAN: r0=448(x1), r1=173(y1), r2=218(x2), r3=69(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 173
LDI r2, 218
LDI r3, 69
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
