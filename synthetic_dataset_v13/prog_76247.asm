; DESCRIPTION: Places a white line segment connecting (108, 150) to (334, 54).
; PLAN: r0=108(x1), r1=150(y1), r2=334(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 150
LDI r2, 334
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
