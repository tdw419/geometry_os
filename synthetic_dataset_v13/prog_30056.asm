; DESCRIPTION: Renders a yellow line between points (136, 136) and (492, 207).
; PLAN: r0=136(x1), r1=136(y1), r2=492(x2), r3=207(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 136
LDI r2, 492
LDI r3, 207
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
