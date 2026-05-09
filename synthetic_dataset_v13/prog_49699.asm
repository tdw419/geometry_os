; DESCRIPTION: Places a cyan line segment connecting (483, 203) to (383, 201).
; PLAN: r0=483(x1), r1=203(y1), r2=383(x2), r3=201(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 203
LDI r2, 383
LDI r3, 201
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
