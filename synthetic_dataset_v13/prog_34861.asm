; DESCRIPTION: Places a white line segment connecting (432, 40) to (364, 215).
; PLAN: r0=432(x1), r1=40(y1), r2=364(x2), r3=215(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 40
LDI r2, 364
LDI r3, 215
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
