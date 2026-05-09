; DESCRIPTION: Places a yellow line segment connecting (80, 141) to (165, 178).
; PLAN: r0=80(x1), r1=141(y1), r2=165(x2), r3=178(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 141
LDI r2, 165
LDI r3, 178
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
