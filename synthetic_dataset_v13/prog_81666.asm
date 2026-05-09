; DESCRIPTION: Places a white line segment connecting (255, 170) to (383, 50).
; PLAN: r0=255(x1), r1=170(y1), r2=383(x2), r3=50(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 170
LDI r2, 383
LDI r3, 50
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
