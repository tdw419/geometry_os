; DESCRIPTION: Draws a red line from (416, 82) to (323, 135).
; PLAN: r0=416(x1), r1=82(y1), r2=323(x2), r3=135(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 82
LDI r2, 323
LDI r3, 135
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
