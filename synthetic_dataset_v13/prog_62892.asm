; DESCRIPTION: Renders a red line between points (411, 6) and (360, 202).
; PLAN: r0=411(x1), r1=6(y1), r2=360(x2), r3=202(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 6
LDI r2, 360
LDI r3, 202
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
