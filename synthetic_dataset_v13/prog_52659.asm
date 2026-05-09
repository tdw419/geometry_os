; DESCRIPTION: Places a green line segment connecting (334, 243) to (260, 245).
; PLAN: r0=334(x1), r1=243(y1), r2=260(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 243
LDI r2, 260
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
