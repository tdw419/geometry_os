; DESCRIPTION: Renders a red line between points (366, 79) and (181, 149).
; PLAN: r0=366(x1), r1=79(y1), r2=181(x2), r3=149(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 79
LDI r2, 181
LDI r3, 149
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
