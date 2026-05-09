; DESCRIPTION: Places a green line segment connecting (141, 218) to (494, 21).
; PLAN: r0=141(x1), r1=218(y1), r2=494(x2), r3=21(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 218
LDI r2, 494
LDI r3, 21
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
