; DESCRIPTION: Places a orange line segment connecting (121, 142) to (150, 196).
; PLAN: r0=121(x1), r1=142(y1), r2=150(x2), r3=196(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 142
LDI r2, 150
LDI r3, 196
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
