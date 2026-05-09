; DESCRIPTION: Draws a red line from (313, 110) to (58, 230).
; PLAN: r0=313(x1), r1=110(y1), r2=58(x2), r3=230(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 110
LDI r2, 58
LDI r3, 230
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
