; DESCRIPTION: Places a orange line segment connecting (476, 168) to (448, 220).
; PLAN: r0=476(x1), r1=168(y1), r2=448(x2), r3=220(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 168
LDI r2, 448
LDI r3, 220
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
