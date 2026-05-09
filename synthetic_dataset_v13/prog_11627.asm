; DESCRIPTION: Draws a yellow line from (287, 56) to (457, 89).
; PLAN: r0=287(x1), r1=56(y1), r2=457(x2), r3=89(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 56
LDI r2, 457
LDI r3, 89
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
