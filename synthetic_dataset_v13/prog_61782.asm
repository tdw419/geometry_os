; DESCRIPTION: Places a yellow line segment connecting (119, 178) to (152, 60).
; PLAN: r0=119(x1), r1=178(y1), r2=152(x2), r3=60(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 178
LDI r2, 152
LDI r3, 60
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
