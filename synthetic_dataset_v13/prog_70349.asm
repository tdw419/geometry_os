; DESCRIPTION: Draws a purple line from (371, 189) to (381, 86).
; PLAN: r0=371(x1), r1=189(y1), r2=381(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 189
LDI r2, 381
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
