; DESCRIPTION: Places a yellow line segment connecting (291, 57) to (81, 205).
; PLAN: r0=291(x1), r1=57(y1), r2=81(x2), r3=205(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 57
LDI r2, 81
LDI r3, 205
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
