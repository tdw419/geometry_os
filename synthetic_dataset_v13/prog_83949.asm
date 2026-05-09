; DESCRIPTION: Draws a red line from (74, 100) to (191, 0).
; PLAN: r0=74(x1), r1=100(y1), r2=191(x2), r3=0(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 100
LDI r2, 191
LDI r3, 0
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
