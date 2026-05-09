; DESCRIPTION: Draws a yellow line from (428, 111) to (432, 200).
; PLAN: r0=428(x1), r1=111(y1), r2=432(x2), r3=200(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 111
LDI r2, 432
LDI r3, 200
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
