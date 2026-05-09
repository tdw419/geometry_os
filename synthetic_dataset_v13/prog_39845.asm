; DESCRIPTION: Renders a red line between points (262, 252) and (364, 133).
; PLAN: r0=262(x1), r1=252(y1), r2=364(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 252
LDI r2, 364
LDI r3, 133
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
