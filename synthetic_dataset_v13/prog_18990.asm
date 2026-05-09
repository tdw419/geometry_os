; DESCRIPTION: Renders a red line between points (174, 197) and (339, 119).
; PLAN: r0=174(x1), r1=197(y1), r2=339(x2), r3=119(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 197
LDI r2, 339
LDI r3, 119
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
