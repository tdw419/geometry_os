; DESCRIPTION: Renders a white line between points (443, 145) and (306, 197).
; PLAN: r0=443(x1), r1=145(y1), r2=306(x2), r3=197(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 145
LDI r2, 306
LDI r3, 197
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
