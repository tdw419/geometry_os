; DESCRIPTION: Draws a purple line from (178, 145) to (79, 95).
; PLAN: r0=178(x1), r1=145(y1), r2=79(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 145
LDI r2, 79
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
