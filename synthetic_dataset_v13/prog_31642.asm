; DESCRIPTION: Renders a yellow line between points (359, 136) and (465, 162).
; PLAN: r0=359(x1), r1=136(y1), r2=465(x2), r3=162(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 136
LDI r2, 465
LDI r3, 162
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
