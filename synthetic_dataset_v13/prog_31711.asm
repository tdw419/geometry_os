; DESCRIPTION: Places a green line segment connecting (454, 27) to (31, 158).
; PLAN: r0=454(x1), r1=27(y1), r2=31(x2), r3=158(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 27
LDI r2, 31
LDI r3, 158
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
