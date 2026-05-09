; DESCRIPTION: Places a white line segment connecting (369, 146) to (176, 68).
; PLAN: r0=369(x1), r1=146(y1), r2=176(x2), r3=68(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 146
LDI r2, 176
LDI r3, 68
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
