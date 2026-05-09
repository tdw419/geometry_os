; DESCRIPTION: Draws a red line from (113, 52) to (353, 74).
; PLAN: r0=113(x1), r1=52(y1), r2=353(x2), r3=74(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 52
LDI r2, 353
LDI r3, 74
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
