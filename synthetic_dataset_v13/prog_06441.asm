; DESCRIPTION: Renders a red line between points (129, 190) and (114, 198).
; PLAN: r0=129(x1), r1=190(y1), r2=114(x2), r3=198(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 190
LDI r2, 114
LDI r3, 198
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
