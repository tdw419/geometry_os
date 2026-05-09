; DESCRIPTION: Renders a red line between points (218, 17) and (118, 251).
; PLAN: r0=218(x1), r1=17(y1), r2=118(x2), r3=251(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 17
LDI r2, 118
LDI r3, 251
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
