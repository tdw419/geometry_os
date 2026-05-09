; DESCRIPTION: Places a white line segment connecting (302, 218) to (107, 19).
; PLAN: r0=302(x1), r1=218(y1), r2=107(x2), r3=19(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 218
LDI r2, 107
LDI r3, 19
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
