; DESCRIPTION: Places a purple line segment connecting (16, 37) to (174, 102).
; PLAN: r0=16(x1), r1=37(y1), r2=174(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 37
LDI r2, 174
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
