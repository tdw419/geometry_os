; DESCRIPTION: Draws a yellow line from (229, 159) to (311, 1).
; PLAN: r0=229(x1), r1=159(y1), r2=311(x2), r3=1(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 159
LDI r2, 311
LDI r3, 1
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
