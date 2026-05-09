; DESCRIPTION: Draws a black line from (314, 162) to (229, 222).
; PLAN: r0=314(x1), r1=162(y1), r2=229(x2), r3=222(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 162
LDI r2, 229
LDI r3, 222
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
