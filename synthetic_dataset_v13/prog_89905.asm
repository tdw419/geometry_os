; DESCRIPTION: Renders a red line between points (175, 49) and (416, 178).
; PLAN: r0=175(x1), r1=49(y1), r2=416(x2), r3=178(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 49
LDI r2, 416
LDI r3, 178
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
