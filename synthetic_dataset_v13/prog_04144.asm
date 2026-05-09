; DESCRIPTION: Draws a yellow line from (99, 70) to (366, 105).
; PLAN: r0=99(x1), r1=70(y1), r2=366(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 70
LDI r2, 366
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
