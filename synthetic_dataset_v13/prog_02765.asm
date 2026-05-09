; DESCRIPTION: Draws a orange line from (15, 114) to (448, 196).
; PLAN: r0=15(x1), r1=114(y1), r2=448(x2), r3=196(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 114
LDI r2, 448
LDI r3, 196
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
