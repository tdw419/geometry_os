; DESCRIPTION: Renders a red line between points (24, 55) and (339, 202).
; PLAN: r0=24(x1), r1=55(y1), r2=339(x2), r3=202(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 55
LDI r2, 339
LDI r3, 202
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
