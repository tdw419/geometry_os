; DESCRIPTION: Places a green line segment connecting (369, 159) to (186, 47).
; PLAN: r0=369(x1), r1=159(y1), r2=186(x2), r3=47(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 159
LDI r2, 186
LDI r3, 47
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
