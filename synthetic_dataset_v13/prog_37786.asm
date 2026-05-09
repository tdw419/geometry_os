; DESCRIPTION: Places a orange line segment connecting (167, 220) to (377, 219).
; PLAN: r0=167(x1), r1=220(y1), r2=377(x2), r3=219(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 220
LDI r2, 377
LDI r3, 219
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
