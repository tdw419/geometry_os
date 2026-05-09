; DESCRIPTION: Draws a red line from (414, 68) to (353, 135).
; PLAN: r0=414(x1), r1=68(y1), r2=353(x2), r3=135(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 68
LDI r2, 353
LDI r3, 135
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
