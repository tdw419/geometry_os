; DESCRIPTION: Renders a orange line between points (95, 169) and (458, 146).
; PLAN: r0=95(x1), r1=169(y1), r2=458(x2), r3=146(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 169
LDI r2, 458
LDI r3, 146
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
