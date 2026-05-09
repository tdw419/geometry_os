; DESCRIPTION: Draws a red line from (145, 182) to (217, 141).
; PLAN: r0=145(x1), r1=182(y1), r2=217(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 182
LDI r2, 217
LDI r3, 141
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
