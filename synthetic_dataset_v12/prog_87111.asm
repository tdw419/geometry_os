; DESCRIPTION: Renders a red line between points (482, 54) and (258, 148).
; PLAN: r0=482(x1), r1=54(y1), r2=258(x2), r3=148(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 54
LDI r2, 258
LDI r3, 148
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
