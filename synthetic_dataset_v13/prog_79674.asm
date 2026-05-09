; DESCRIPTION: Places a blue line segment connecting (464, 240) to (160, 152).
; PLAN: r0=464(x1), r1=240(y1), r2=160(x2), r3=152(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 240
LDI r2, 160
LDI r3, 152
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
