; DESCRIPTION: Places a yellow line segment connecting (229, 195) to (169, 245).
; PLAN: r0=229(x1), r1=195(y1), r2=169(x2), r3=245(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 195
LDI r2, 169
LDI r3, 245
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
