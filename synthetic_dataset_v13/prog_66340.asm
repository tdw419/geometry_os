; DESCRIPTION: Renders a red line between points (259, 221) and (404, 155).
; PLAN: r0=259(x1), r1=221(y1), r2=404(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 221
LDI r2, 404
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
