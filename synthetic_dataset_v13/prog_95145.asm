; DESCRIPTION: Places a cyan line segment connecting (142, 83) to (383, 181).
; PLAN: r0=142(x1), r1=83(y1), r2=383(x2), r3=181(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 83
LDI r2, 383
LDI r3, 181
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
