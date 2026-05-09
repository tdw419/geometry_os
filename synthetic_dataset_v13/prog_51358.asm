; DESCRIPTION: Places a yellow line segment connecting (369, 38) to (417, 246).
; PLAN: r0=369(x1), r1=38(y1), r2=417(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 38
LDI r2, 417
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
