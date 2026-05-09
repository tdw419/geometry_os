; DESCRIPTION: Draws a magenta line from (355, 54) to (104, 2).
; PLAN: r0=355(x1), r1=54(y1), r2=104(x2), r3=2(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 54
LDI r2, 104
LDI r3, 2
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
