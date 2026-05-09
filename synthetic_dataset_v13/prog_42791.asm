; DESCRIPTION: Draws a red line from (118, 112) to (390, 213).
; PLAN: r0=118(x1), r1=112(y1), r2=390(x2), r3=213(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 112
LDI r2, 390
LDI r3, 213
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
