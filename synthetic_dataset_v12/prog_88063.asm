; DESCRIPTION: Places a white line segment connecting (328, 170) to (256, 214).
; PLAN: r0=328(x1), r1=170(y1), r2=256(x2), r3=214(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 170
LDI r2, 256
LDI r3, 214
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
