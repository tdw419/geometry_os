; DESCRIPTION: Renders a red line between points (212, 161) and (89, 107).
; PLAN: r0=212(x1), r1=161(y1), r2=89(x2), r3=107(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 161
LDI r2, 89
LDI r3, 107
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
