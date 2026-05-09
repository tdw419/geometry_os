; DESCRIPTION: Places a yellow line segment connecting (73, 52) to (161, 15).
; PLAN: r0=73(x1), r1=52(y1), r2=161(x2), r3=15(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 52
LDI r2, 161
LDI r3, 15
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
