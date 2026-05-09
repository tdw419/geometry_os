; DESCRIPTION: Places a green line segment connecting (38, 78) to (378, 192).
; PLAN: r0=38(x1), r1=78(y1), r2=378(x2), r3=192(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 78
LDI r2, 378
LDI r3, 192
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
