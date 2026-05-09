; DESCRIPTION: Renders a red line between points (403, 233) and (240, 133).
; PLAN: r0=403(x1), r1=233(y1), r2=240(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 233
LDI r2, 240
LDI r3, 133
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
