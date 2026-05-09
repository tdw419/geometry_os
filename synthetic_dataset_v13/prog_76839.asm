; DESCRIPTION: Draws a red line from (455, 134) to (80, 227).
; PLAN: r0=455(x1), r1=134(y1), r2=80(x2), r3=227(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 134
LDI r2, 80
LDI r3, 227
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
