; DESCRIPTION: Places a white line segment connecting (70, 15) to (44, 123).
; PLAN: r0=70(x1), r1=15(y1), r2=44(x2), r3=123(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 15
LDI r2, 44
LDI r3, 123
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
