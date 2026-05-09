; DESCRIPTION: Places a orange line segment connecting (488, 149) to (132, 74).
; PLAN: r0=488(x1), r1=149(y1), r2=132(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 149
LDI r2, 132
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
