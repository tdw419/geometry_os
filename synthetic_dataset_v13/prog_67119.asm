; DESCRIPTION: Places a purple line segment connecting (321, 53) to (275, 187).
; PLAN: r0=321(x1), r1=53(y1), r2=275(x2), r3=187(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 53
LDI r2, 275
LDI r3, 187
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
