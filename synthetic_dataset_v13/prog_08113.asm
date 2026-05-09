; DESCRIPTION: Draws a purple line from (13, 63) to (423, 120).
; PLAN: r0=13(x1), r1=63(y1), r2=423(x2), r3=120(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 63
LDI r2, 423
LDI r3, 120
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
