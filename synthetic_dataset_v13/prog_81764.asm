; DESCRIPTION: Places a blue line segment connecting (415, 122) to (63, 108).
; PLAN: r0=415(x1), r1=122(y1), r2=63(x2), r3=108(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 122
LDI r2, 63
LDI r3, 108
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
