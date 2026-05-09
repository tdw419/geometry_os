; DESCRIPTION: Places a green line segment connecting (386, 169) to (355, 21).
; PLAN: r0=386(x1), r1=169(y1), r2=355(x2), r3=21(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 169
LDI r2, 355
LDI r3, 21
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
