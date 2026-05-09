; DESCRIPTION: Places a yellow line segment connecting (338, 149) to (119, 121).
; PLAN: r0=338(x1), r1=149(y1), r2=119(x2), r3=121(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 149
LDI r2, 119
LDI r3, 121
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
