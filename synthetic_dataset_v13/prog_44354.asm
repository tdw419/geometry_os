; DESCRIPTION: Draws a magenta line from (229, 110) to (232, 214).
; PLAN: r0=229(x1), r1=110(y1), r2=232(x2), r3=214(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 110
LDI r2, 232
LDI r3, 214
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
