; DESCRIPTION: Places a green line segment connecting (355, 95) to (369, 153).
; PLAN: r0=355(x1), r1=95(y1), r2=369(x2), r3=153(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 95
LDI r2, 369
LDI r3, 153
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
