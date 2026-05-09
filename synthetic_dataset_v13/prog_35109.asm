; DESCRIPTION: Places a magenta line segment connecting (17, 114) to (395, 248).
; PLAN: r0=17(x1), r1=114(y1), r2=395(x2), r3=248(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 114
LDI r2, 395
LDI r3, 248
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
