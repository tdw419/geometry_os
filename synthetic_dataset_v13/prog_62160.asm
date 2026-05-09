; DESCRIPTION: Draws a red line from (447, 255) to (217, 229).
; PLAN: r0=447(x1), r1=255(y1), r2=217(x2), r3=229(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 255
LDI r2, 217
LDI r3, 229
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
