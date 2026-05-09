; DESCRIPTION: Renders a red line between points (110, 212) and (437, 114).
; PLAN: r0=110(x1), r1=212(y1), r2=437(x2), r3=114(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 212
LDI r2, 437
LDI r3, 114
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
