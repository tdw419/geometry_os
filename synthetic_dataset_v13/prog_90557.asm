; DESCRIPTION: Places a blue line segment connecting (206, 100) to (310, 193).
; PLAN: r0=206(x1), r1=100(y1), r2=310(x2), r3=193(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 100
LDI r2, 310
LDI r3, 193
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
