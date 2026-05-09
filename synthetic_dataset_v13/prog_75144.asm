; DESCRIPTION: Places a green line segment connecting (508, 150) to (48, 251).
; PLAN: r0=508(x1), r1=150(y1), r2=48(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 150
LDI r2, 48
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
