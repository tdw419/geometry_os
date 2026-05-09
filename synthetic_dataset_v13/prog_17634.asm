; DESCRIPTION: Draws a red line from (66, 112) to (145, 66).
; PLAN: r0=66(x1), r1=112(y1), r2=145(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 112
LDI r2, 145
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
