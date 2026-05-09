; DESCRIPTION: Places a blue line segment connecting (152, 159) to (412, 140).
; PLAN: r0=152(x1), r1=159(y1), r2=412(x2), r3=140(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 159
LDI r2, 412
LDI r3, 140
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
