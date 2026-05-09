; DESCRIPTION: Draws a red line from (59, 198) to (243, 145).
; PLAN: r0=59(x1), r1=198(y1), r2=243(x2), r3=145(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 198
LDI r2, 243
LDI r3, 145
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
