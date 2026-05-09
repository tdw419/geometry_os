; DESCRIPTION: Places a cyan line segment connecting (439, 94) to (383, 12).
; PLAN: r0=439(x1), r1=94(y1), r2=383(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 94
LDI r2, 383
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
