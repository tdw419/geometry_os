; DESCRIPTION: Places a white line segment connecting (326, 104) to (123, 163).
; PLAN: r0=326(x1), r1=104(y1), r2=123(x2), r3=163(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 104
LDI r2, 123
LDI r3, 163
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
