; DESCRIPTION: Draws a magenta line from (88, 250) to (334, 141).
; PLAN: r0=88(x1), r1=250(y1), r2=334(x2), r3=141(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 250
LDI r2, 334
LDI r3, 141
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
