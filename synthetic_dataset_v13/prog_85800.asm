; DESCRIPTION: Draws a purple line from (295, 190) to (142, 95).
; PLAN: r0=295(x1), r1=190(y1), r2=142(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 190
LDI r2, 142
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
