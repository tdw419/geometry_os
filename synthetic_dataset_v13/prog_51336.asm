; DESCRIPTION: Draws a yellow line from (252, 91) to (5, 85).
; PLAN: r0=252(x1), r1=91(y1), r2=5(x2), r3=85(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 91
LDI r2, 5
LDI r3, 85
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
