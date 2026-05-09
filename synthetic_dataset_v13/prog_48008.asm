; DESCRIPTION: Draws a red line from (261, 217) to (108, 58).
; PLAN: r0=261(x1), r1=217(y1), r2=108(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 217
LDI r2, 108
LDI r3, 58
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
