; DESCRIPTION: Places a yellow line segment connecting (119, 200) to (434, 5).
; PLAN: r0=119(x1), r1=200(y1), r2=434(x2), r3=5(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 200
LDI r2, 434
LDI r3, 5
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
