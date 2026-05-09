; DESCRIPTION: Places a green line segment connecting (365, 110) to (383, 143).
; PLAN: r0=365(x1), r1=110(y1), r2=383(x2), r3=143(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 110
LDI r2, 383
LDI r3, 143
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
