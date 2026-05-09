; DESCRIPTION: Places a white line segment connecting (430, 19) to (80, 240).
; PLAN: r0=430(x1), r1=19(y1), r2=80(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 19
LDI r2, 80
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
