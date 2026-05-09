; DESCRIPTION: Renders a yellow line between points (369, 72) and (157, 26).
; PLAN: r0=369(x1), r1=72(y1), r2=157(x2), r3=26(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 72
LDI r2, 157
LDI r3, 26
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
