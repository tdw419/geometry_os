; DESCRIPTION: Renders a yellow line between points (95, 196) and (97, 230).
; PLAN: r0=95(x1), r1=196(y1), r2=97(x2), r3=230(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 196
LDI r2, 97
LDI r3, 230
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
