; DESCRIPTION: Renders a red line between points (102, 52) and (248, 12).
; PLAN: r0=102(x1), r1=52(y1), r2=248(x2), r3=12(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 52
LDI r2, 248
LDI r3, 12
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
