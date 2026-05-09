; DESCRIPTION: Draws a purple line from (38, 230) to (85, 95).
; PLAN: r0=38(x1), r1=230(y1), r2=85(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 230
LDI r2, 85
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
