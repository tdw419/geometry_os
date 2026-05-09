; DESCRIPTION: Places a yellow line segment connecting (245, 141) to (39, 85).
; PLAN: r0=245(x1), r1=141(y1), r2=39(x2), r3=85(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 141
LDI r2, 39
LDI r3, 85
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
