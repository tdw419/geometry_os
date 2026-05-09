; DESCRIPTION: Places a blue line segment connecting (504, 78) to (173, 133).
; PLAN: r0=504(x1), r1=78(y1), r2=173(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 78
LDI r2, 173
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
