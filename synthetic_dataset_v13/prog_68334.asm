; DESCRIPTION: Draws a red line from (270, 78) to (507, 230).
; PLAN: r0=270(x1), r1=78(y1), r2=507(x2), r3=230(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 78
LDI r2, 507
LDI r3, 230
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
