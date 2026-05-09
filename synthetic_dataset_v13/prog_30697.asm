; DESCRIPTION: Draws a red line from (132, 90) to (264, 74).
; PLAN: r0=132(x1), r1=90(y1), r2=264(x2), r3=74(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 90
LDI r2, 264
LDI r3, 74
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
