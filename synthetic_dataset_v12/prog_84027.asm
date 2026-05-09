; DESCRIPTION: Draws a red line from (501, 159) to (504, 163).
; PLAN: r0=501(x1), r1=159(y1), r2=504(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 159
LDI r2, 504
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
