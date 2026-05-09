; DESCRIPTION: Draws a purple line from (377, 95) to (211, 59).
; PLAN: r0=377(x1), r1=95(y1), r2=211(x2), r3=59(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 95
LDI r2, 211
LDI r3, 59
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
