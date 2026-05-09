; DESCRIPTION: Draws a magenta line from (222, 163) to (437, 9).
; PLAN: r0=222(x1), r1=163(y1), r2=437(x2), r3=9(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 163
LDI r2, 437
LDI r3, 9
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
