; DESCRIPTION: Places a blue line segment connecting (108, 143) to (114, 136).
; PLAN: r0=108(x1), r1=143(y1), r2=114(x2), r3=136(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 143
LDI r2, 114
LDI r3, 136
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
