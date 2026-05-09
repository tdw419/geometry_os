; DESCRIPTION: Draws a red line from (21, 194) to (462, 217).
; PLAN: r0=21(x1), r1=194(y1), r2=462(x2), r3=217(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 194
LDI r2, 462
LDI r3, 217
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
