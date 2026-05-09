; DESCRIPTION: Places a orange line segment connecting (243, 150) to (84, 74).
; PLAN: r0=243(x1), r1=150(y1), r2=84(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 150
LDI r2, 84
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
