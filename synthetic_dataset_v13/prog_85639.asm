; DESCRIPTION: Places a green line segment connecting (138, 117) to (208, 245).
; PLAN: r0=138(x1), r1=117(y1), r2=208(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 117
LDI r2, 208
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
