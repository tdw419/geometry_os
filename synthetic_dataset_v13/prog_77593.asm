; DESCRIPTION: Renders a red line between points (312, 176) and (259, 241).
; PLAN: r0=312(x1), r1=176(y1), r2=259(x2), r3=241(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 176
LDI r2, 259
LDI r3, 241
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
