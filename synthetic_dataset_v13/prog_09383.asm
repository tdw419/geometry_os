; DESCRIPTION: Draws a blue line from (265, 193) to (486, 169).
; PLAN: r0=265(x1), r1=193(y1), r2=486(x2), r3=169(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 193
LDI r2, 486
LDI r3, 169
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
