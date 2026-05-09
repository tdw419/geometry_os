; DESCRIPTION: Places a white line segment connecting (266, 167) to (166, 69).
; PLAN: r0=266(x1), r1=167(y1), r2=166(x2), r3=69(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 167
LDI r2, 166
LDI r3, 69
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
