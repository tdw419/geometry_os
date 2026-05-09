; DESCRIPTION: Draws a purple line from (331, 152) to (119, 74).
; PLAN: r0=331(x1), r1=152(y1), r2=119(x2), r3=74(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 152
LDI r2, 119
LDI r3, 74
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
