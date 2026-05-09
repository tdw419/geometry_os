; DESCRIPTION: Places a red line segment connecting (255, 142) to (430, 129).
; PLAN: r0=255(x1), r1=142(y1), r2=430(x2), r3=129(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 142
LDI r2, 430
LDI r3, 129
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
