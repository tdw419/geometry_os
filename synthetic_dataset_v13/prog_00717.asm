; DESCRIPTION: Places a white line segment connecting (101, 6) to (436, 139).
; PLAN: r0=101(x1), r1=6(y1), r2=436(x2), r3=139(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 6
LDI r2, 436
LDI r3, 139
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
