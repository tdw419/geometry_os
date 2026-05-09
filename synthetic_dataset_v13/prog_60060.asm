; DESCRIPTION: Places a white line segment connecting (20, 106) to (459, 4).
; PLAN: r0=20(x1), r1=106(y1), r2=459(x2), r3=4(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 106
LDI r2, 459
LDI r3, 4
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
