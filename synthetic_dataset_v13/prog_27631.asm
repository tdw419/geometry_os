; DESCRIPTION: Renders a yellow line between points (416, 70) and (6, 10).
; PLAN: r0=416(x1), r1=70(y1), r2=6(x2), r3=10(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 70
LDI r2, 6
LDI r3, 10
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
