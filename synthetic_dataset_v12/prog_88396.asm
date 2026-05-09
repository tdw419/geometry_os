; DESCRIPTION: Renders a magenta line between points (457, 127) and (432, 34).
; PLAN: r0=457(x1), r1=127(y1), r2=432(x2), r3=34(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 127
LDI r2, 432
LDI r3, 34
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
