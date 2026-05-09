; DESCRIPTION: Places a white line segment connecting (353, 170) to (503, 157).
; PLAN: r0=353(x1), r1=170(y1), r2=503(x2), r3=157(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 170
LDI r2, 503
LDI r3, 157
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
