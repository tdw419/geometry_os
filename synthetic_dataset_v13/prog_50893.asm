; DESCRIPTION: Renders a red line between points (213, 123) and (118, 230).
; PLAN: r0=213(x1), r1=123(y1), r2=118(x2), r3=230(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 123
LDI r2, 118
LDI r3, 230
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
