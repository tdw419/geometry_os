; DESCRIPTION: Places a blue line segment connecting (412, 72) to (270, 223).
; PLAN: r0=412(x1), r1=72(y1), r2=270(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 72
LDI r2, 270
LDI r3, 223
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
