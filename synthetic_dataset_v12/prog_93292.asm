; DESCRIPTION: Places a black line segment connecting (406, 91) to (261, 31).
; PLAN: r0=406(x1), r1=91(y1), r2=261(x2), r3=31(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 91
LDI r2, 261
LDI r3, 31
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
