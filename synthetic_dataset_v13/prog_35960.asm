; DESCRIPTION: Renders a yellow line between points (95, 108) and (430, 29).
; PLAN: r0=95(x1), r1=108(y1), r2=430(x2), r3=29(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 108
LDI r2, 430
LDI r3, 29
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
