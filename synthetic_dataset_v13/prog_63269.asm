; DESCRIPTION: Places a white line segment connecting (88, 212) to (491, 149).
; PLAN: r0=88(x1), r1=212(y1), r2=491(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 212
LDI r2, 491
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
