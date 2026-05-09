; DESCRIPTION: Places a green line segment connecting (116, 83) to (461, 94).
; PLAN: r0=116(x1), r1=83(y1), r2=461(x2), r3=94(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 83
LDI r2, 461
LDI r3, 94
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
