; DESCRIPTION: Places a yellow line segment connecting (494, 212) to (363, 229).
; PLAN: r0=494(x1), r1=212(y1), r2=363(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 212
LDI r2, 363
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
