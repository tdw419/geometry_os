; DESCRIPTION: Draws a yellow line from (396, 170) to (36, 182).
; PLAN: r0=396(x1), r1=170(y1), r2=36(x2), r3=182(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 170
LDI r2, 36
LDI r3, 182
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
