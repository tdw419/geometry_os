; DESCRIPTION: Renders a orange line between points (137, 198) and (443, 173).
; PLAN: r0=137(x1), r1=198(y1), r2=443(x2), r3=173(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 198
LDI r2, 443
LDI r3, 173
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
