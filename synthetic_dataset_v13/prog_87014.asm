; DESCRIPTION: Renders a orange line between points (443, 115) and (150, 54).
; PLAN: r0=443(x1), r1=115(y1), r2=150(x2), r3=54(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 115
LDI r2, 150
LDI r3, 54
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
