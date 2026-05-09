; DESCRIPTION: Draws a red line from (451, 175) to (124, 98).
; PLAN: r0=451(x1), r1=175(y1), r2=124(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 175
LDI r2, 124
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
