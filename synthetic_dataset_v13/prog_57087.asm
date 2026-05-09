; DESCRIPTION: Draws a magenta line from (432, 43) to (338, 170).
; PLAN: r0=432(x1), r1=43(y1), r2=338(x2), r3=170(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 43
LDI r2, 338
LDI r3, 170
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
