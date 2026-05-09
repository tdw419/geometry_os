; DESCRIPTION: Draws a blue line from (471, 83) to (331, 13).
; PLAN: r0=471(x1), r1=83(y1), r2=331(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 83
LDI r2, 331
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
