; DESCRIPTION: Draws a magenta line from (77, 101) to (270, 9).
; PLAN: r0=77(x1), r1=101(y1), r2=270(x2), r3=9(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 101
LDI r2, 270
LDI r3, 9
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
