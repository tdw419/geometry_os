; DESCRIPTION: Renders a yellow line between points (117, 70) and (188, 88).
; PLAN: r0=117(x1), r1=70(y1), r2=188(x2), r3=88(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 70
LDI r2, 188
LDI r3, 88
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
