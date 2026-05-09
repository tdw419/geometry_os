; DESCRIPTION: Places a yellow line segment connecting (6, 191) to (214, 188).
; PLAN: r0=6(x1), r1=191(y1), r2=214(x2), r3=188(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 191
LDI r2, 214
LDI r3, 188
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
