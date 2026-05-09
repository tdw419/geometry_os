; DESCRIPTION: Places a yellow line segment connecting (427, 54) to (74, 26).
; PLAN: r0=427(x1), r1=54(y1), r2=74(x2), r3=26(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 54
LDI r2, 74
LDI r3, 26
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
