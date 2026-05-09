; DESCRIPTION: Places a cyan line segment connecting (139, 123) to (357, 56).
; PLAN: r0=139(x1), r1=123(y1), r2=357(x2), r3=56(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 123
LDI r2, 357
LDI r3, 56
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
