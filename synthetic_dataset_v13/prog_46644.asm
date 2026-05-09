; DESCRIPTION: Renders a red line between points (153, 78) and (482, 247).
; PLAN: r0=153(x1), r1=78(y1), r2=482(x2), r3=247(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 78
LDI r2, 482
LDI r3, 247
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
