; DESCRIPTION: Places a black line segment connecting (334, 83) to (157, 187).
; PLAN: r0=334(x1), r1=83(y1), r2=157(x2), r3=187(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 83
LDI r2, 157
LDI r3, 187
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
