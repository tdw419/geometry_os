; DESCRIPTION: Draws a purple line from (263, 108) to (3, 140).
; PLAN: r0=263(x1), r1=108(y1), r2=3(x2), r3=140(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 108
LDI r2, 3
LDI r3, 140
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
