; DESCRIPTION: Draws a red line from (350, 172) to (377, 149).
; PLAN: r0=350(x1), r1=172(y1), r2=377(x2), r3=149(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 172
LDI r2, 377
LDI r3, 149
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
