; DESCRIPTION: Places a blue line segment connecting (196, 7) to (59, 85).
; PLAN: r0=196(x1), r1=7(y1), r2=59(x2), r3=85(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 7
LDI r2, 59
LDI r3, 85
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
