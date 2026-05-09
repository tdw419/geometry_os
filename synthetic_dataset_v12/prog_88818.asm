; DESCRIPTION: Renders a red line between points (136, 135) and (206, 114).
; PLAN: r0=136(x1), r1=135(y1), r2=206(x2), r3=114(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 135
LDI r2, 206
LDI r3, 114
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
