; DESCRIPTION: Renders a yellow line between points (119, 10) and (70, 68).
; PLAN: r0=119(x1), r1=10(y1), r2=70(x2), r3=68(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 10
LDI r2, 70
LDI r3, 68
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
