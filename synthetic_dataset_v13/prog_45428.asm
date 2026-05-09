; DESCRIPTION: Places a blue line segment connecting (475, 101) to (206, 66).
; PLAN: r0=475(x1), r1=101(y1), r2=206(x2), r3=66(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 101
LDI r2, 206
LDI r3, 66
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
