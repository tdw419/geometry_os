; DESCRIPTION: Draws a orange line from (369, 114) to (21, 170).
; PLAN: r0=369(x1), r1=114(y1), r2=21(x2), r3=170(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 114
LDI r2, 21
LDI r3, 170
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
