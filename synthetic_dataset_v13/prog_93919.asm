; DESCRIPTION: Draws a magenta line from (486, 100) to (166, 35).
; PLAN: r0=486(x1), r1=100(y1), r2=166(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 100
LDI r2, 166
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
