; DESCRIPTION: Renders a red line between points (119, 58) and (259, 103).
; PLAN: r0=119(x1), r1=58(y1), r2=259(x2), r3=103(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 58
LDI r2, 259
LDI r3, 103
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
