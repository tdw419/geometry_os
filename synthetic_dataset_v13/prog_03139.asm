; DESCRIPTION: Renders a red line between points (11, 161) and (306, 202).
; PLAN: r0=11(x1), r1=161(y1), r2=306(x2), r3=202(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 161
LDI r2, 306
LDI r3, 202
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
