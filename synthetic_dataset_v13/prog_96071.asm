; DESCRIPTION: Places a white line segment connecting (139, 181) to (70, 4).
; PLAN: r0=139(x1), r1=181(y1), r2=70(x2), r3=4(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 181
LDI r2, 70
LDI r3, 4
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
