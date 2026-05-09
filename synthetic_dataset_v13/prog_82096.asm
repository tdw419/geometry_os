; DESCRIPTION: Draws a magenta line from (456, 145) to (186, 216).
; PLAN: r0=456(x1), r1=145(y1), r2=186(x2), r3=216(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 145
LDI r2, 186
LDI r3, 216
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
