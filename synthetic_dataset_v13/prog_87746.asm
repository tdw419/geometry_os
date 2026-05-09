; DESCRIPTION: Draws a red line from (472, 206) to (8, 92).
; PLAN: r0=472(x1), r1=206(y1), r2=8(x2), r3=92(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 206
LDI r2, 8
LDI r3, 92
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
