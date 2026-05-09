; DESCRIPTION: Places a blue line segment connecting (387, 153) to (28, 4).
; PLAN: r0=387(x1), r1=153(y1), r2=28(x2), r3=4(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 153
LDI r2, 28
LDI r3, 4
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
