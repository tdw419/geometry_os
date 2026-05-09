; DESCRIPTION: Places a white line segment connecting (89, 4) to (189, 59).
; PLAN: r0=89(x1), r1=4(y1), r2=189(x2), r3=59(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 4
LDI r2, 189
LDI r3, 59
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
