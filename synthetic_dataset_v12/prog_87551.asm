; DESCRIPTION: Draws a red line from (236, 141) to (403, 205).
; PLAN: r0=236(x1), r1=141(y1), r2=403(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 141
LDI r2, 403
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
