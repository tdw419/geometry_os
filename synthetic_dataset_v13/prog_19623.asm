; DESCRIPTION: Draws a magenta line from (366, 166) to (229, 130).
; PLAN: r0=366(x1), r1=166(y1), r2=229(x2), r3=130(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 166
LDI r2, 229
LDI r3, 130
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
