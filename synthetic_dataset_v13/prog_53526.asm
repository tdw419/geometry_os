; DESCRIPTION: Places a blue line segment connecting (172, 46) to (72, 74).
; PLAN: r0=172(x1), r1=46(y1), r2=72(x2), r3=74(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 46
LDI r2, 72
LDI r3, 74
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
