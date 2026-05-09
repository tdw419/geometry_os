; DESCRIPTION: Renders a red line between points (158, 240) and (139, 249).
; PLAN: r0=158(x1), r1=240(y1), r2=139(x2), r3=249(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 240
LDI r2, 139
LDI r3, 249
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
