; DESCRIPTION: Places a blue line segment connecting (392, 220) to (421, 206).
; PLAN: r0=392(x1), r1=220(y1), r2=421(x2), r3=206(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 220
LDI r2, 421
LDI r3, 206
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
