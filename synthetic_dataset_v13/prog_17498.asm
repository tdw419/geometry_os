; DESCRIPTION: Renders a red line between points (144, 123) and (102, 26).
; PLAN: r0=144(x1), r1=123(y1), r2=102(x2), r3=26(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 123
LDI r2, 102
LDI r3, 26
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
