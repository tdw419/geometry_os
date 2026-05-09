; DESCRIPTION: Draws a red line from (278, 119) to (403, 20).
; PLAN: r0=278(x1), r1=119(y1), r2=403(x2), r3=20(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 119
LDI r2, 403
LDI r3, 20
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
