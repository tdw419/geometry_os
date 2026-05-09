; DESCRIPTION: Places a yellow line segment connecting (353, 226) to (3, 184).
; PLAN: r0=353(x1), r1=226(y1), r2=3(x2), r3=184(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 226
LDI r2, 3
LDI r3, 184
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
