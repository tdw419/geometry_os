; DESCRIPTION: Renders a red line between points (125, 164) and (35, 99).
; PLAN: r0=125(x1), r1=164(y1), r2=35(x2), r3=99(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 164
LDI r2, 35
LDI r3, 99
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
