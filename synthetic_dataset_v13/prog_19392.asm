; DESCRIPTION: Draws a magenta line from (460, 3) to (311, 22).
; PLAN: r0=460(x1), r1=3(y1), r2=311(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 3
LDI r2, 311
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
