; DESCRIPTION: Places a white line segment connecting (23, 83) to (7, 187).
; PLAN: r0=23(x1), r1=83(y1), r2=7(x2), r3=187(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 83
LDI r2, 7
LDI r3, 187
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
