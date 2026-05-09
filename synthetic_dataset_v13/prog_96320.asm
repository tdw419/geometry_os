; DESCRIPTION: Places a yellow line segment connecting (31, 91) to (38, 66).
; PLAN: r0=31(x1), r1=91(y1), r2=38(x2), r3=66(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 91
LDI r2, 38
LDI r3, 66
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
