; DESCRIPTION: Draws a orange line from (106, 101) to (279, 87).
; PLAN: r0=106(x1), r1=101(y1), r2=279(x2), r3=87(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 101
LDI r2, 279
LDI r3, 87
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
