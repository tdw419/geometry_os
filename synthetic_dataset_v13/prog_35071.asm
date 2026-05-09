; DESCRIPTION: Places a yellow line segment connecting (46, 79) to (34, 181).
; PLAN: r0=46(x1), r1=79(y1), r2=34(x2), r3=181(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 79
LDI r2, 34
LDI r3, 181
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
