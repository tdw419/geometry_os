; DESCRIPTION: Draws a magenta line from (364, 101) to (78, 202).
; PLAN: r0=364(x1), r1=101(y1), r2=78(x2), r3=202(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 101
LDI r2, 78
LDI r3, 202
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
