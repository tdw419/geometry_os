; DESCRIPTION: Draws a yellow line from (79, 72) to (169, 209).
; PLAN: r0=79(x1), r1=72(y1), r2=169(x2), r3=209(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 72
LDI r2, 169
LDI r3, 209
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
