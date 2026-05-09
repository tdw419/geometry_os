; DESCRIPTION: Places a orange line segment connecting (121, 111) to (1, 205).
; PLAN: r0=121(x1), r1=111(y1), r2=1(x2), r3=205(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 111
LDI r2, 1
LDI r3, 205
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
