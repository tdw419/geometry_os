; DESCRIPTION: Renders a white line between points (118, 10) and (416, 168).
; PLAN: r0=118(x1), r1=10(y1), r2=416(x2), r3=168(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 10
LDI r2, 416
LDI r3, 168
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
