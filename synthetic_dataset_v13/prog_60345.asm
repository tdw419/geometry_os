; DESCRIPTION: Places a white line segment connecting (367, 167) to (49, 217).
; PLAN: r0=367(x1), r1=167(y1), r2=49(x2), r3=217(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 167
LDI r2, 49
LDI r3, 217
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
