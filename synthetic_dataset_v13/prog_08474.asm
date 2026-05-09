; DESCRIPTION: Places a yellow line segment connecting (33, 217) to (396, 95).
; PLAN: r0=33(x1), r1=217(y1), r2=396(x2), r3=95(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 217
LDI r2, 396
LDI r3, 95
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
