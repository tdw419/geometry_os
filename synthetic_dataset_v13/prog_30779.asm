; DESCRIPTION: Renders a red line between points (59, 100) and (423, 221).
; PLAN: r0=59(x1), r1=100(y1), r2=423(x2), r3=221(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 100
LDI r2, 423
LDI r3, 221
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
