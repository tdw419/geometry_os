; DESCRIPTION: Renders a red line between points (416, 153) and (86, 207).
; PLAN: r0=416(x1), r1=153(y1), r2=86(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 153
LDI r2, 86
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
