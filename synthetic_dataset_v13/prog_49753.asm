; DESCRIPTION: Places a blue line segment connecting (256, 29) to (38, 152).
; PLAN: r0=256(x1), r1=29(y1), r2=38(x2), r3=152(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 29
LDI r2, 38
LDI r3, 152
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
