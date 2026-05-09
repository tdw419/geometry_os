; DESCRIPTION: Places a yellow line segment connecting (271, 52) to (232, 83).
; PLAN: r0=271(x1), r1=52(y1), r2=232(x2), r3=83(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 52
LDI r2, 232
LDI r3, 83
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
