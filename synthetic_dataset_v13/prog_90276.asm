; DESCRIPTION: Draws a magenta line from (207, 7) to (36, 74).
; PLAN: r0=207(x1), r1=7(y1), r2=36(x2), r3=74(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 7
LDI r2, 36
LDI r3, 74
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
