; DESCRIPTION: Places a blue line segment connecting (151, 85) to (229, 28).
; PLAN: r0=151(x1), r1=85(y1), r2=229(x2), r3=28(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 85
LDI r2, 229
LDI r3, 28
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
