; DESCRIPTION: Places a white line segment connecting (178, 104) to (457, 46).
; PLAN: r0=178(x1), r1=104(y1), r2=457(x2), r3=46(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 104
LDI r2, 457
LDI r3, 46
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
