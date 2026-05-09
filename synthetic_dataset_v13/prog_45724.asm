; DESCRIPTION: Draws a red line from (160, 203) to (424, 100).
; PLAN: r0=160(x1), r1=203(y1), r2=424(x2), r3=100(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 203
LDI r2, 424
LDI r3, 100
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
