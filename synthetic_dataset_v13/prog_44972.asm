; DESCRIPTION: Draws a red line from (447, 114) to (176, 80).
; PLAN: r0=447(x1), r1=114(y1), r2=176(x2), r3=80(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 114
LDI r2, 176
LDI r3, 80
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
