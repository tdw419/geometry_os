; DESCRIPTION: Renders a red line between points (309, 110) and (26, 120).
; PLAN: r0=309(x1), r1=110(y1), r2=26(x2), r3=120(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 110
LDI r2, 26
LDI r3, 120
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
