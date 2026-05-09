; DESCRIPTION: Places a yellow line segment connecting (332, 137) to (334, 214).
; PLAN: r0=332(x1), r1=137(y1), r2=334(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 137
LDI r2, 334
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
