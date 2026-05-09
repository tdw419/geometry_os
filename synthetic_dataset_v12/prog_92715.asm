; DESCRIPTION: Renders a red line between points (482, 95) and (74, 233).
; PLAN: r0=482(x1), r1=95(y1), r2=74(x2), r3=233(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 95
LDI r2, 74
LDI r3, 233
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
