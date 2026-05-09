; DESCRIPTION: Places a yellow line segment connecting (101, 6) to (26, 9).
; PLAN: r0=101(x1), r1=6(y1), r2=26(x2), r3=9(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 6
LDI r2, 26
LDI r3, 9
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
