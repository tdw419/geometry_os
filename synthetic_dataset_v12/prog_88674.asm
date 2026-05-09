; DESCRIPTION: Draws a purple line from (55, 186) to (138, 25).
; PLAN: r0=55(x1), r1=186(y1), r2=138(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 186
LDI r2, 138
LDI r3, 25
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
