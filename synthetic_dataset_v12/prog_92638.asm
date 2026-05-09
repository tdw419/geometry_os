; DESCRIPTION: Draws a orange line from (457, 150) to (279, 66).
; PLAN: r0=457(x1), r1=150(y1), r2=279(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 150
LDI r2, 279
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
