; DESCRIPTION: Renders a red line between points (287, 174) and (332, 149).
; PLAN: r0=287(x1), r1=174(y1), r2=332(x2), r3=149(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 174
LDI r2, 332
LDI r3, 149
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
