; DESCRIPTION: Draws a red line from (306, 76) to (17, 100).
; PLAN: r0=306(x1), r1=76(y1), r2=17(x2), r3=100(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 76
LDI r2, 17
LDI r3, 100
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
