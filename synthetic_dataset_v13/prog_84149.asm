; DESCRIPTION: Places a orange line segment connecting (121, 136) to (52, 138).
; PLAN: r0=121(x1), r1=136(y1), r2=52(x2), r3=138(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 136
LDI r2, 52
LDI r3, 138
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
