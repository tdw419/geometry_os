; DESCRIPTION: Draws a red line from (119, 132) to (163, 225).
; PLAN: r0=119(x1), r1=132(y1), r2=163(x2), r3=225(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 132
LDI r2, 163
LDI r3, 225
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
