; DESCRIPTION: Draws a red line from (137, 97) to (221, 68).
; PLAN: r0=137(x1), r1=97(y1), r2=221(x2), r3=68(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 97
LDI r2, 221
LDI r3, 68
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
