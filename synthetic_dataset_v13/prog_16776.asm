; DESCRIPTION: Places a blue line segment connecting (247, 181) to (283, 100).
; PLAN: r0=247(x1), r1=181(y1), r2=283(x2), r3=100(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 181
LDI r2, 283
LDI r3, 100
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
