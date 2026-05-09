; DESCRIPTION: Places a blue line segment connecting (50, 21) to (504, 67).
; PLAN: r0=50(x1), r1=21(y1), r2=504(x2), r3=67(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 21
LDI r2, 504
LDI r3, 67
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
