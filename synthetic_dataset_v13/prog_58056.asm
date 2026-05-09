; DESCRIPTION: Draws a red line from (373, 19) to (179, 3).
; PLAN: r0=373(x1), r1=19(y1), r2=179(x2), r3=3(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 19
LDI r2, 179
LDI r3, 3
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
