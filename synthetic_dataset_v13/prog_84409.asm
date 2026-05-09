; DESCRIPTION: Places a yellow line segment connecting (261, 0) to (247, 193).
; PLAN: r0=261(x1), r1=0(y1), r2=247(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 0
LDI r2, 247
LDI r3, 193
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
