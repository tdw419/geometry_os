; DESCRIPTION: Renders a red line between points (339, 246) and (418, 2).
; PLAN: r0=339(x1), r1=246(y1), r2=418(x2), r3=2(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 246
LDI r2, 418
LDI r3, 2
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
