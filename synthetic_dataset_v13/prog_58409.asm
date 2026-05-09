; DESCRIPTION: Draws a purple line from (342, 144) to (95, 49).
; PLAN: r0=342(x1), r1=144(y1), r2=95(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 144
LDI r2, 95
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
