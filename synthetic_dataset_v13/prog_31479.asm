; DESCRIPTION: Places a yellow line segment connecting (32, 133) to (357, 186).
; PLAN: r0=32(x1), r1=133(y1), r2=357(x2), r3=186(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 133
LDI r2, 357
LDI r3, 186
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
