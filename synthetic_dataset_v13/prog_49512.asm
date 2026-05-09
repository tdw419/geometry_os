; DESCRIPTION: Places a purple line segment connecting (372, 155) to (176, 196).
; PLAN: r0=372(x1), r1=155(y1), r2=176(x2), r3=196(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 155
LDI r2, 176
LDI r3, 196
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
