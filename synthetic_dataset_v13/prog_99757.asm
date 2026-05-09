; DESCRIPTION: Renders a red line between points (92, 121) and (505, 207).
; PLAN: r0=92(x1), r1=121(y1), r2=505(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 121
LDI r2, 505
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
