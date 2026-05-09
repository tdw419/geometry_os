; DESCRIPTION: Draws a blue line from (454, 52) to (231, 212).
; PLAN: r0=454(x1), r1=52(y1), r2=231(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 52
LDI r2, 231
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
