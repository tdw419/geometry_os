; DESCRIPTION: Places a green line segment connecting (85, 57) to (202, 232).
; PLAN: r0=85(x1), r1=57(y1), r2=202(x2), r3=232(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 57
LDI r2, 202
LDI r3, 232
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
