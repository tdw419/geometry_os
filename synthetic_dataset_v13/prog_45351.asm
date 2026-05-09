; DESCRIPTION: Places a yellow line segment connecting (397, 123) to (475, 119).
; PLAN: r0=397(x1), r1=123(y1), r2=475(x2), r3=119(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 123
LDI r2, 475
LDI r3, 119
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
