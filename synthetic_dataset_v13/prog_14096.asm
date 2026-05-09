; DESCRIPTION: Places a blue line segment connecting (74, 202) to (222, 229).
; PLAN: r0=74(x1), r1=202(y1), r2=222(x2), r3=229(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 202
LDI r2, 222
LDI r3, 229
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
