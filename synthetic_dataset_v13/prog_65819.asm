; DESCRIPTION: Places a cyan line segment connecting (390, 22) to (439, 93).
; PLAN: r0=390(x1), r1=22(y1), r2=439(x2), r3=93(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 22
LDI r2, 439
LDI r3, 93
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
