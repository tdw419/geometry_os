; DESCRIPTION: Places a yellow line segment connecting (287, 15) to (46, 36).
; PLAN: r0=287(x1), r1=15(y1), r2=46(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 15
LDI r2, 46
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
