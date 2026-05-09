; DESCRIPTION: Places a black line segment connecting (74, 139) to (43, 38).
; PLAN: r0=74(x1), r1=139(y1), r2=43(x2), r3=38(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 139
LDI r2, 43
LDI r3, 38
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
