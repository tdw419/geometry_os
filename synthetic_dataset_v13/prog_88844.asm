; DESCRIPTION: Draws a purple line from (266, 138) to (395, 167).
; PLAN: r0=266(x1), r1=138(y1), r2=395(x2), r3=167(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 138
LDI r2, 395
LDI r3, 167
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
