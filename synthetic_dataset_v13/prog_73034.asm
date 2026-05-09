; DESCRIPTION: Draws a red line from (95, 194) to (222, 14).
; PLAN: r0=95(x1), r1=194(y1), r2=222(x2), r3=14(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 194
LDI r2, 222
LDI r3, 14
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
