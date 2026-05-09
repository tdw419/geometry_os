; DESCRIPTION: Places a green line segment connecting (171, 86) to (407, 80).
; PLAN: r0=171(x1), r1=86(y1), r2=407(x2), r3=80(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 86
LDI r2, 407
LDI r3, 80
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
