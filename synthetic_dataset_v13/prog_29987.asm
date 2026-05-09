; DESCRIPTION: Draws a purple line from (263, 231) to (385, 47).
; PLAN: r0=263(x1), r1=231(y1), r2=385(x2), r3=47(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 231
LDI r2, 385
LDI r3, 47
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
