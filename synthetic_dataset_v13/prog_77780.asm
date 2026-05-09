; DESCRIPTION: Renders a red line between points (90, 26) and (437, 233).
; PLAN: r0=90(x1), r1=26(y1), r2=437(x2), r3=233(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 26
LDI r2, 437
LDI r3, 233
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
