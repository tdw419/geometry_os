; DESCRIPTION: Places a white line segment connecting (101, 117) to (251, 4).
; PLAN: r0=101(x1), r1=117(y1), r2=251(x2), r3=4(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 117
LDI r2, 251
LDI r3, 4
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
