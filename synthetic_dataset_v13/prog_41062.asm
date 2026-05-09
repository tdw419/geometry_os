; DESCRIPTION: Renders a red line between points (87, 238) and (110, 165).
; PLAN: r0=87(x1), r1=238(y1), r2=110(x2), r3=165(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 238
LDI r2, 110
LDI r3, 165
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
