; DESCRIPTION: Places a green line segment connecting (334, 195) to (99, 195).
; PLAN: r0=334(x1), r1=195(y1), r2=99(x2), r3=195(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 195
LDI r2, 99
LDI r3, 195
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
