; DESCRIPTION: Places a cyan line segment connecting (366, 241) to (510, 139).
; PLAN: r0=366(x1), r1=241(y1), r2=510(x2), r3=139(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 241
LDI r2, 510
LDI r3, 139
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
