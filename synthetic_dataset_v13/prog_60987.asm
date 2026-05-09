; DESCRIPTION: Draws a red line from (439, 144) to (79, 114).
; PLAN: r0=439(x1), r1=144(y1), r2=79(x2), r3=114(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 144
LDI r2, 79
LDI r3, 114
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
