; DESCRIPTION: Draws a white line from (369, 68) to (37, 28).
; PLAN: r0=369(x1), r1=68(y1), r2=37(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 68
LDI r2, 37
LDI r3, 28
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
