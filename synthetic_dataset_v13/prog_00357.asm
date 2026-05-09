; DESCRIPTION: Places a cyan line segment connecting (374, 170) to (444, 139).
; PLAN: r0=374(x1), r1=170(y1), r2=444(x2), r3=139(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 170
LDI r2, 444
LDI r3, 139
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
