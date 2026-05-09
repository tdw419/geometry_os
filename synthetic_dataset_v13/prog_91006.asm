; DESCRIPTION: Draws a magenta line from (266, 194) to (334, 123).
; PLAN: r0=266(x1), r1=194(y1), r2=334(x2), r3=123(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 194
LDI r2, 334
LDI r3, 123
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
