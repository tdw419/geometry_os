; DESCRIPTION: Places a cyan line segment connecting (383, 199) to (129, 36).
; PLAN: r0=383(x1), r1=199(y1), r2=129(x2), r3=36(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 199
LDI r2, 129
LDI r3, 36
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
