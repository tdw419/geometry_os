; DESCRIPTION: Places a yellow line segment connecting (375, 90) to (313, 139).
; PLAN: r0=375(x1), r1=90(y1), r2=313(x2), r3=139(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 90
LDI r2, 313
LDI r3, 139
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
