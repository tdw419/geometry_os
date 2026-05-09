; DESCRIPTION: Places a yellow line segment connecting (17, 79) to (153, 252).
; PLAN: r0=17(x1), r1=79(y1), r2=153(x2), r3=252(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 79
LDI r2, 153
LDI r3, 252
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
