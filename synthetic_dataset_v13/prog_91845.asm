; DESCRIPTION: Renders a red line between points (379, 164) and (259, 104).
; PLAN: r0=379(x1), r1=164(y1), r2=259(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 164
LDI r2, 259
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
