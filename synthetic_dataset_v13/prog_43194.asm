; DESCRIPTION: Draws a blue line from (169, 177) to (252, 161).
; PLAN: r0=169(x1), r1=177(y1), r2=252(x2), r3=161(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 177
LDI r2, 252
LDI r3, 161
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
