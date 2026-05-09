; DESCRIPTION: Draws a blue line from (331, 87) to (371, 252).
; PLAN: r0=331(x1), r1=87(y1), r2=371(x2), r3=252(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 87
LDI r2, 371
LDI r3, 252
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
