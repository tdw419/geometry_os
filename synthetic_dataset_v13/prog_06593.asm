; DESCRIPTION: Draws a green line from (169, 84) to (411, 137).
; PLAN: r0=169(x1), r1=84(y1), r2=411(x2), r3=137(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 84
LDI r2, 411
LDI r3, 137
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
