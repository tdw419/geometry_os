; DESCRIPTION: Places a yellow line segment connecting (476, 127) to (245, 182).
; PLAN: r0=476(x1), r1=127(y1), r2=245(x2), r3=182(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 127
LDI r2, 245
LDI r3, 182
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
