; DESCRIPTION: Draws a orange line from (369, 168) to (284, 138).
; PLAN: r0=369(x1), r1=168(y1), r2=284(x2), r3=138(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 168
LDI r2, 284
LDI r3, 138
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
