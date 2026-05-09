; DESCRIPTION: Places a green line segment connecting (94, 171) to (192, 75).
; PLAN: r0=94(x1), r1=171(y1), r2=192(x2), r3=75(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 171
LDI r2, 192
LDI r3, 75
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
