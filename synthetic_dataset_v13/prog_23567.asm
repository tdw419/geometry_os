; DESCRIPTION: Places a white line segment connecting (136, 13) to (428, 167).
; PLAN: r0=136(x1), r1=13(y1), r2=428(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 13
LDI r2, 428
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
