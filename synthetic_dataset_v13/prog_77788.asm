; DESCRIPTION: Renders a yellow line between points (119, 4) and (197, 144).
; PLAN: r0=119(x1), r1=4(y1), r2=197(x2), r3=144(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 4
LDI r2, 197
LDI r3, 144
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
