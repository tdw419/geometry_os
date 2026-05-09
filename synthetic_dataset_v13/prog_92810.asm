; DESCRIPTION: Places a yellow line segment connecting (334, 255) to (249, 101).
; PLAN: r0=334(x1), r1=255(y1), r2=249(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 255
LDI r2, 249
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
