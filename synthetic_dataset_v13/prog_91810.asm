; DESCRIPTION: Draws a blue line from (466, 116) to (377, 206).
; PLAN: r0=466(x1), r1=116(y1), r2=377(x2), r3=206(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 116
LDI r2, 377
LDI r3, 206
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
