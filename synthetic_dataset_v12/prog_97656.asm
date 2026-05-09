; DESCRIPTION: Places a blue line segment connecting (250, 127) to (59, 167).
; PLAN: r0=250(x1), r1=127(y1), r2=59(x2), r3=167(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 127
LDI r2, 59
LDI r3, 167
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
