; DESCRIPTION: Draws a orange line from (192, 120) to (369, 164).
; PLAN: r0=192(x1), r1=120(y1), r2=369(x2), r3=164(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 120
LDI r2, 369
LDI r3, 164
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
