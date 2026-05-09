; DESCRIPTION: Places a yellow line segment connecting (472, 241) to (28, 120).
; PLAN: r0=472(x1), r1=241(y1), r2=28(x2), r3=120(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 241
LDI r2, 28
LDI r3, 120
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
