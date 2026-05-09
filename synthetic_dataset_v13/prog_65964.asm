; DESCRIPTION: Places a green line segment connecting (467, 229) to (331, 157).
; PLAN: r0=467(x1), r1=229(y1), r2=331(x2), r3=157(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 229
LDI r2, 331
LDI r3, 157
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
