; DESCRIPTION: Draws a white line from (130, 63) to (369, 168).
; PLAN: r0=130(x1), r1=63(y1), r2=369(x2), r3=168(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 63
LDI r2, 369
LDI r3, 168
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
