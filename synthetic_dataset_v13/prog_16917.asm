; DESCRIPTION: Draws a purple line from (392, 8) to (454, 83).
; PLAN: r0=392(x1), r1=8(y1), r2=454(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 8
LDI r2, 454
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
