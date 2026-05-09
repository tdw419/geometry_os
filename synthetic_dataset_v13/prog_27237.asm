; DESCRIPTION: Renders a red line between points (41, 176) and (250, 197).
; PLAN: r0=41(x1), r1=176(y1), r2=250(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 176
LDI r2, 250
LDI r3, 197
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
