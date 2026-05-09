; DESCRIPTION: Places a cyan line segment connecting (83, 201) to (326, 110).
; PLAN: r0=83(x1), r1=201(y1), r2=326(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 201
LDI r2, 326
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
