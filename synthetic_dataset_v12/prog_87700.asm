; DESCRIPTION: Places a white line segment connecting (17, 139) to (10, 121).
; PLAN: r0=17(x1), r1=139(y1), r2=10(x2), r3=121(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 139
LDI r2, 10
LDI r3, 121
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
