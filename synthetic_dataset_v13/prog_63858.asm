; DESCRIPTION: Places a green line segment connecting (383, 151) to (486, 31).
; PLAN: r0=383(x1), r1=151(y1), r2=486(x2), r3=31(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 151
LDI r2, 486
LDI r3, 31
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
