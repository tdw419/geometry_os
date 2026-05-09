; DESCRIPTION: Places a blue line segment connecting (151, 8) to (346, 123).
; PLAN: r0=151(x1), r1=8(y1), r2=346(x2), r3=123(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 8
LDI r2, 346
LDI r3, 123
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
