; DESCRIPTION: Draws a orange line from (455, 162) to (449, 116).
; PLAN: r0=455(x1), r1=162(y1), r2=449(x2), r3=116(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 162
LDI r2, 449
LDI r3, 116
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
