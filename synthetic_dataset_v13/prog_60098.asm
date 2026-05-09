; DESCRIPTION: Draws a red line from (161, 65) to (431, 137).
; PLAN: r0=161(x1), r1=65(y1), r2=431(x2), r3=137(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 65
LDI r2, 431
LDI r3, 137
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
