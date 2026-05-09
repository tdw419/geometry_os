; DESCRIPTION: Places a blue line segment connecting (269, 101) to (208, 121).
; PLAN: r0=269(x1), r1=101(y1), r2=208(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 101
LDI r2, 208
LDI r3, 121
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
