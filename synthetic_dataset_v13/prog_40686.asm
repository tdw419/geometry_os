; DESCRIPTION: Places a purple line segment connecting (503, 136) to (475, 104).
; PLAN: r0=503(x1), r1=136(y1), r2=475(x2), r3=104(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 136
LDI r2, 475
LDI r3, 104
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
