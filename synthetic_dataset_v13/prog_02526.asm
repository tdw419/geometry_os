; DESCRIPTION: Places a white line segment connecting (62, 4) to (245, 0).
; PLAN: r0=62(x1), r1=4(y1), r2=245(x2), r3=0(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 4
LDI r2, 245
LDI r3, 0
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
