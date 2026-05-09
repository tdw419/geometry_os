; DESCRIPTION: Draws a blue line from (169, 215) to (123, 75).
; PLAN: r0=169(x1), r1=215(y1), r2=123(x2), r3=75(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 215
LDI r2, 123
LDI r3, 75
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
