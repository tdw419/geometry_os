; DESCRIPTION: Draws a red line from (110, 154) to (489, 216).
; PLAN: r0=110(x1), r1=154(y1), r2=489(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 154
LDI r2, 489
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
