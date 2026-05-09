; DESCRIPTION: Places a blue line segment connecting (295, 109) to (476, 36).
; PLAN: r0=295(x1), r1=109(y1), r2=476(x2), r3=36(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 109
LDI r2, 476
LDI r3, 36
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
