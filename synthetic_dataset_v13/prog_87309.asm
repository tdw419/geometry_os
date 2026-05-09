; DESCRIPTION: Draws a red line from (10, 57) to (383, 163).
; PLAN: r0=10(x1), r1=57(y1), r2=383(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 57
LDI r2, 383
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
