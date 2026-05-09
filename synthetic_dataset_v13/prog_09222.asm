; DESCRIPTION: Draws a magenta line from (428, 67) to (166, 112).
; PLAN: r0=428(x1), r1=67(y1), r2=166(x2), r3=112(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 67
LDI r2, 166
LDI r3, 112
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
