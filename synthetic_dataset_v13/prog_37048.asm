; DESCRIPTION: Draws a purple line from (108, 198) to (463, 16).
; PLAN: r0=108(x1), r1=198(y1), r2=463(x2), r3=16(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 198
LDI r2, 463
LDI r3, 16
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
