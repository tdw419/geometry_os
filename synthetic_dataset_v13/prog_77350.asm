; DESCRIPTION: Draws a red line from (323, 36) to (135, 67).
; PLAN: r0=323(x1), r1=36(y1), r2=135(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 36
LDI r2, 135
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
