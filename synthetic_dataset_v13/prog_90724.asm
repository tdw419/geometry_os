; DESCRIPTION: Draws a green line from (59, 227) to (369, 233).
; PLAN: r0=59(x1), r1=227(y1), r2=369(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 227
LDI r2, 369
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
