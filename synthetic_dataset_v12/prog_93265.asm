; DESCRIPTION: Places a yellow line segment connecting (121, 20) to (252, 159).
; PLAN: r0=121(x1), r1=20(y1), r2=252(x2), r3=159(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 20
LDI r2, 252
LDI r3, 159
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
