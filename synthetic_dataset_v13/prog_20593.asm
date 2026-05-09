; DESCRIPTION: Draws a black line from (432, 102) to (362, 123).
; PLAN: r0=432(x1), r1=102(y1), r2=362(x2), r3=123(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 102
LDI r2, 362
LDI r3, 123
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
