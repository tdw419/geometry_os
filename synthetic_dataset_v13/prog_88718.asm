; DESCRIPTION: Draws a orange line from (1, 151) to (455, 88).
; PLAN: r0=1(x1), r1=151(y1), r2=455(x2), r3=88(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 151
LDI r2, 455
LDI r3, 88
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
