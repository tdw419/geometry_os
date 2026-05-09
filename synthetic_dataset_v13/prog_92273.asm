; DESCRIPTION: Draws a red line from (163, 91) to (38, 56).
; PLAN: r0=163(x1), r1=91(y1), r2=38(x2), r3=56(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 91
LDI r2, 38
LDI r3, 56
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
