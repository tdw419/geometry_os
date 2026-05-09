; DESCRIPTION: Places a green line segment connecting (236, 35) to (334, 200).
; PLAN: r0=236(x1), r1=35(y1), r2=334(x2), r3=200(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 35
LDI r2, 334
LDI r3, 200
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
