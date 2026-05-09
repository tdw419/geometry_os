; DESCRIPTION: Places a blue line segment connecting (148, 46) to (499, 237).
; PLAN: r0=148(x1), r1=46(y1), r2=499(x2), r3=237(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 46
LDI r2, 499
LDI r3, 237
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
