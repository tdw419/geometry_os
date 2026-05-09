; DESCRIPTION: Renders a red line between points (296, 47) and (87, 194).
; PLAN: r0=296(x1), r1=47(y1), r2=87(x2), r3=194(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 47
LDI r2, 87
LDI r3, 194
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
