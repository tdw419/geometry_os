; DESCRIPTION: Renders a red line between points (54, 50) and (443, 181).
; PLAN: r0=54(x1), r1=50(y1), r2=443(x2), r3=181(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 50
LDI r2, 443
LDI r3, 181
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
