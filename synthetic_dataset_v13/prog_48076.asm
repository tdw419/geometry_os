; DESCRIPTION: Draws a purple line from (446, 87) to (222, 181).
; PLAN: r0=446(x1), r1=87(y1), r2=222(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 87
LDI r2, 222
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
