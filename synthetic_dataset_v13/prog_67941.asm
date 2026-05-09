; DESCRIPTION: Draws a blue line from (143, 143) to (169, 218).
; PLAN: r0=143(x1), r1=143(y1), r2=169(x2), r3=218(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 143
LDI r2, 169
LDI r3, 218
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
