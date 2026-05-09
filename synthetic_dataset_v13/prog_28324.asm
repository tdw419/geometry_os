; DESCRIPTION: Renders a red line between points (233, 208) and (100, 39).
; PLAN: r0=233(x1), r1=208(y1), r2=100(x2), r3=39(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 208
LDI r2, 100
LDI r3, 39
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
