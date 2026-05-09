; DESCRIPTION: Places a yellow line segment connecting (40, 205) to (265, 78).
; PLAN: r0=40(x1), r1=205(y1), r2=265(x2), r3=78(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 205
LDI r2, 265
LDI r3, 78
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
