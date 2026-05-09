; DESCRIPTION: Draws a red line from (217, 254) to (14, 79).
; PLAN: r0=217(x1), r1=254(y1), r2=14(x2), r3=79(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 254
LDI r2, 14
LDI r3, 79
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
