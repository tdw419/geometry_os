; DESCRIPTION: Draws a red line from (84, 161) to (462, 104).
; PLAN: r0=84(x1), r1=161(y1), r2=462(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 161
LDI r2, 462
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
