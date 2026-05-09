; DESCRIPTION: Draws a red line from (266, 149) to (43, 46).
; PLAN: r0=266(x1), r1=149(y1), r2=43(x2), r3=46(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 149
LDI r2, 43
LDI r3, 46
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
