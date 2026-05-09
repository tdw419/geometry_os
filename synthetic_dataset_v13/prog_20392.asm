; DESCRIPTION: Draws a purple line from (169, 46) to (37, 57).
; PLAN: r0=169(x1), r1=46(y1), r2=37(x2), r3=57(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 46
LDI r2, 37
LDI r3, 57
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
