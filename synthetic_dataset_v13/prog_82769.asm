; DESCRIPTION: Places a white line segment connecting (104, 123) to (94, 231).
; PLAN: r0=104(x1), r1=123(y1), r2=94(x2), r3=231(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 123
LDI r2, 94
LDI r3, 231
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
