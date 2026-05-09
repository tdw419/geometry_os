; DESCRIPTION: Draws a red line from (59, 30) to (447, 167).
; PLAN: r0=59(x1), r1=30(y1), r2=447(x2), r3=167(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 30
LDI r2, 447
LDI r3, 167
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
