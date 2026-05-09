; DESCRIPTION: Draws a yellow line from (432, 46) to (311, 19).
; PLAN: r0=432(x1), r1=46(y1), r2=311(x2), r3=19(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 46
LDI r2, 311
LDI r3, 19
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
