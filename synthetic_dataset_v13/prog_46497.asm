; DESCRIPTION: Renders a red line between points (43, 95) and (125, 181).
; PLAN: r0=43(x1), r1=95(y1), r2=125(x2), r3=181(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 95
LDI r2, 125
LDI r3, 181
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
