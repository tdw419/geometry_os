; DESCRIPTION: Places a green line segment connecting (110, 240) to (508, 120).
; PLAN: r0=110(x1), r1=240(y1), r2=508(x2), r3=120(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 240
LDI r2, 508
LDI r3, 120
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
