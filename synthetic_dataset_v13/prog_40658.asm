; DESCRIPTION: Places a green line segment connecting (467, 218) to (66, 44).
; PLAN: r0=467(x1), r1=218(y1), r2=66(x2), r3=44(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 218
LDI r2, 66
LDI r3, 44
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
