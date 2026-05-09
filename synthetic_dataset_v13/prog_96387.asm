; DESCRIPTION: Places a white line segment connecting (163, 164) to (369, 255).
; PLAN: r0=163(x1), r1=164(y1), r2=369(x2), r3=255(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 164
LDI r2, 369
LDI r3, 255
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
