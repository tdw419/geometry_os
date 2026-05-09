; DESCRIPTION: Places a white line segment connecting (36, 5) to (383, 4).
; PLAN: r0=36(x1), r1=5(y1), r2=383(x2), r3=4(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 5
LDI r2, 383
LDI r3, 4
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
