; DESCRIPTION: Places a green line segment connecting (259, 213) to (334, 119).
; PLAN: r0=259(x1), r1=213(y1), r2=334(x2), r3=119(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 213
LDI r2, 334
LDI r3, 119
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
