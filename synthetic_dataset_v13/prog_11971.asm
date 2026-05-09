; DESCRIPTION: Draws a blue line from (411, 18) to (214, 248).
; PLAN: r0=411(x1), r1=18(y1), r2=214(x2), r3=248(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 18
LDI r2, 214
LDI r3, 248
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
