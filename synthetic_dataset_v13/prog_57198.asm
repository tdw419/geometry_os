; DESCRIPTION: Draws a red line from (390, 160) to (95, 186).
; PLAN: r0=390(x1), r1=160(y1), r2=95(x2), r3=186(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 160
LDI r2, 95
LDI r3, 186
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
