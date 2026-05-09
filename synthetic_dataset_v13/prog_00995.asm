; DESCRIPTION: Places a white line segment connecting (459, 188) to (383, 190).
; PLAN: r0=459(x1), r1=188(y1), r2=383(x2), r3=190(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 188
LDI r2, 383
LDI r3, 190
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
