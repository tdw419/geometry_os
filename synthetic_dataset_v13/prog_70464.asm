; DESCRIPTION: Renders a red line between points (4, 47) and (344, 153).
; PLAN: r0=4(x1), r1=47(y1), r2=344(x2), r3=153(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 47
LDI r2, 344
LDI r3, 153
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
