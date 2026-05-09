; DESCRIPTION: Draws a red line from (105, 16) to (462, 252).
; PLAN: r0=105(x1), r1=16(y1), r2=462(x2), r3=252(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 16
LDI r2, 462
LDI r3, 252
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
