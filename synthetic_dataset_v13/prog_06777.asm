; DESCRIPTION: Places a white line segment connecting (40, 34) to (24, 20).
; PLAN: r0=40(x1), r1=34(y1), r2=24(x2), r3=20(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 34
LDI r2, 24
LDI r3, 20
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
