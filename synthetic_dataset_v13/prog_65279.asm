; DESCRIPTION: Draws a yellow line from (4, 108) to (484, 133).
; PLAN: r0=4(x1), r1=108(y1), r2=484(x2), r3=133(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 108
LDI r2, 484
LDI r3, 133
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
