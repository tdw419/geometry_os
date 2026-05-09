; DESCRIPTION: Renders a yellow line between points (136, 2) and (113, 25).
; PLAN: r0=136(x1), r1=2(y1), r2=113(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 2
LDI r2, 113
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
