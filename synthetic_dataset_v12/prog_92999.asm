; DESCRIPTION: Draws a blue line from (15, 78) to (459, 81).
; PLAN: r0=15(x1), r1=78(y1), r2=459(x2), r3=81(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 78
LDI r2, 459
LDI r3, 81
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
