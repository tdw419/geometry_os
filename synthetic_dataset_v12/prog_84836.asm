; DESCRIPTION: Places a green line segment connecting (91, 65) to (469, 85).
; PLAN: r0=91(x1), r1=65(y1), r2=469(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 65
LDI r2, 469
LDI r3, 85
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
