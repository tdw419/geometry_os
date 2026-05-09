; DESCRIPTION: Draws a red line from (226, 183) to (132, 251).
; PLAN: r0=226(x1), r1=183(y1), r2=132(x2), r3=251(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 183
LDI r2, 132
LDI r3, 251
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
